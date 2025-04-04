Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1C21A4F2D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807425; cv=none; b=Cy1OP/BjT5QZVDgFv2wLkU0MmPcCxbr6pjYVrbiMY9W7XDjgppP9E7m4HKMFjTXJboLBATW3G+64L2VFSWaf2aT8kG5iRToJ6bstTo0Ragu/D6aUweUPN7asYeLg33Tj85nNKUwuhKTTRaFL7hSO0cOIQ8pgeLAjwMQWBzke2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807425; c=relaxed/simple;
	bh=IQJ0fvofASEvsIGj8BQe6qpDwitFwPQCocyVi0hhduk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xy+bnSIpocuTYIpdg7mbU8hfLFReAWG2qBCjXUz6YuzeQL0WDyqLLWQW7algyd0Z5CeKT4aAxOlqAMh4mtgXfPv4C90piaqpzQvNnizJmXzp4dDzoii1XVDt4cFtxwqFNqU4o6ytGAO2XN2o85gbKLv7tAh/kfuVdGpYbzUopvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D0dgBbzm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D0dgBbzm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25d2b2354so454523466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743807422; x=1744412222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUvAMJN7a+mUWz56T/QYJnMdlarIxyMfDMpTXRfo540=;
        b=D0dgBbzmdJPgpGtuZMu24+UB/d6t42dAjF6lXmY9D1UTfILyEdXhpyDU+ctzwpeO7x
         I6d9vrxaxp4CmsRKlHf92d+E/kU6V+lBRuAtFtfhYDQ8/5Itvcy9abU5/1gVTmpp8xHl
         CaG5nDf5BAxn+2tcut+eoO2lgDENzaCc/ZTM7qeBfzyZK0d48TA3246qFI8maqoyXbP4
         DaRb9xDQKrLpTeJIPLrg6NgGaSrf/6cdrHfjxhh26bxLmfGWnUJNPgMikYVgN8ux5wwQ
         RCuYP/Y2PopVIZCsu48Wy7JPpI/zWzjGutphtNQF1Zot8CMBf36patKXRAJZRYz8BtoL
         lrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807422; x=1744412222;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUvAMJN7a+mUWz56T/QYJnMdlarIxyMfDMpTXRfo540=;
        b=gQGnBfGvW2tUZeEz0X8meF3yj4nTzhzwR2KdxEU+mHCL/OjqNbiJks8pOnga8+oWsj
         yp83ajCH4TRHfSpYndMptlS/kzOhXFWeZrG8MAluQQ7f7hB8nDhNXx9A2QGyxiQOheWo
         Q2Ob9EYOqgiHl0mQNkmOEFPDHK8meYjhXOxqTClHZQxRdYOIOHiQ+8XL7TE5JdvwIf11
         xkqoxeu3ew6d25MRSs6iGNqXMfvjhkrCK4135FUa+Rs83w7POvPsJ/41Xo3mzq6INrxG
         v5UGLSbaz/kdX+YLjZtCRBKkrEgUAlNmC9TaB4qokSvtfqdg6vMDEJLX9Gxx+ukZk8/A
         3Ytw==
X-Forwarded-Encrypted: i=1; AJvYcCViGjEPHmQ5O9mthlwjRt7bk0HTI/SYEgrSxYkPhRKRWQCUjb3JRrsxOhDPQbVFkveQJ6sQcm42yq8H3kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQBImDIxtFUhaiDyHlep96L1kF+qqdhOB1jJCNwFPt2a2VxhJr
	8hSxKRjDqM0/ncJFbtcyBmYX2/Nil4AkwbENcd59eac6S3/r9C1uJWVb9VogI6E=
X-Gm-Gg: ASbGnctiILVP8/O65v3PKzyVldBMOx2P7wwK8qraJausz7pTWPLYwjzEUDYdIUiB4/X
	WeNTuen+aSV7yM9cRsalUlHXCxieD/YLydlkPTxp/KEqEqohDdHYsdxTgqOKf3zLE0zeVVmy+g9
	WSbUcPnvEvBtiH3fnottKd4UcnZRkQUI6apJ5fOPTrq2n/W07iztdx+C6UyfHoNl+RX1j5lWELu
	uWWjfQGoFfh1rk95+loNEWVex/q1bRrFmeqdUeDhug7s+Va4hxsdruMTWXUK+AgWM9gSX1Sr2xf
	rmIgWDImYCtGQ8hG4wl8YGkUiZBKXIPtkD+v5tVwA5pdMcX7mw==
X-Google-Smtp-Source: AGHT+IFstlVHevq12xIqmlOF3Xj0EZVEkLfWM4v9tS8EgPSXMh4vyUPP9FqMK6weyL9zVCXKmT9Wtw==
X-Received: by 2002:a17:907:7e98:b0:ac2:622f:39c1 with SMTP id a640c23a62f3a-ac7d6d06cd9mr318153066b.22.1743807421863;
        Fri, 04 Apr 2025 15:57:01 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5c45asm321658066b.1.2025.04.04.15.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:57:01 -0700 (PDT)
Message-ID: <86903805-569a-41d5-93d8-df8169e61cef@suse.com>
Date: Sat, 5 Apr 2025 01:56:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] x86/bugs: Fix RSB clearing in
 indirect_branch_prediction_barrier()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, amit@kernel.org,
 kvm@vger.kernel.org, amit.shah@amd.com, thomas.lendacky@amd.com,
 bp@alien8.de, tglx@linutronix.de, peterz@infradead.org,
 pawan.kumar.gupta@linux.intel.com, corbet@lwn.net, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, seanjc@google.com,
 pbonzini@redhat.com, daniel.sneddon@linux.intel.com, kai.huang@intel.com,
 sandipan.das@amd.com, boris.ostrovsky@oracle.com, Babu.Moger@amd.com,
 david.kaplan@amd.com, dwmw@amazon.co.uk, andrew.cooper3@citrix.com
References: <cover.1743617897.git.jpoimboe@kernel.org>
 <27fe2029a2ef8bc0909e53e7e4c3f5b437242627.1743617897.git.jpoimboe@kernel.org>
 <d5ad36d8-40da-4c13-a6a7-ed8494496577@suse.com>
 <ioxjh7izpnmbutljkbhdqorlpwtm5iwosorltmhkp3t7nyoqlo@tiecv24hnbar>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <ioxjh7izpnmbutljkbhdqorlpwtm5iwosorltmhkp3t7nyoqlo@tiecv24hnbar>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4.04.25 г. 18:17 ч., Josh Poimboeuf wrote:
> On Fri, Apr 04, 2025 at 05:45:37PM +0300, Nikolay Borisov wrote:
>>
>>
>> On 2.04.25 г. 21:19 ч., Josh Poimboeuf wrote:
>>> IBPB is expected to clear the RSB.  However, if X86_BUG_IBPB_NO_RET is
>>> set, that doesn't happen.  Make indirect_branch_prediction_barrier()
>>> take that into account by calling __write_ibpb() which already does the
>>> right thing.
>>
>> I find this changelog somewhat dubious. So zen < 4 basically have
>> IBPB_NO_RET, your patch 2 in this series makes using SBPB for cores which
>> have SRSO_NO or if the mitigation is disabled. So if you have a core which
>> is zen <4 and doesn't use SBPB then what happens?
> 
> I'm afraid I don't understand the question.  In that case write_ibpb()
> uses IBPB and manually clears the RSB.
> 

Actually isn't this patch a noop. The old code simply wrote the value of 
x86_pred_cmd to the IA32-PRED_CMD register iff FEATURE_IBPB was set. So 
x86_pred_cmd might contain either PRED_CMD_IBPB or PRED_CMD_SBPB, 
meaning the correct value was written.

With your change you now call __write_ibpb() which does effectively the 
same thing.
