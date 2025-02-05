Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FB22A4CB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748304; cv=none; b=AsPrK29HTRMgDmI9svE9BdKOAWlvlyiLS/zt407Q5yuXdUMvkQ8uGLXbqubRP259jmPmgjdGOrN2TrQ/oaCdfvq1C6Zm6Cc7d3kdLpXsRuhfPfrkpmItXICOzVOHDqP3Fr1B99J+5nGeV5t11HTfF7mOGJYKZfCppTkdGQMVii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748304; c=relaxed/simple;
	bh=7c3hH/C0ty80foBKuB31iqczubI+r+OraZ1ZxIaqE7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhQiTmMQfIJ26n6YgxTlR1dtbadaaDHC6dzf0yfR2MQlPGmNnCxqf7AtoRUtNBkrGA3ESt0bmLG0enEQuY/MVa9vY/yjbQPb2oQrtyRiE0mIA4R3F4UPJe+fbZ01k3+x5qxWLgdRg///F7+5QLoFFdOLZSfTSqfB1DLggRkR1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=bP1AIq3w; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="bP1AIq3w"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38daf1f5091so743726f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 01:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738748301; x=1739353101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7c3hH/C0ty80foBKuB31iqczubI+r+OraZ1ZxIaqE7Y=;
        b=bP1AIq3wlgIzgTBiAJ0CjQW/e3BYyEamzmU0Har5mcnsY8ZIReOOCRUXIKypMHmAUs
         44/Pq1Y2/EexfnpViUeDNX32TX8AV1dgdCIiQq8vQIxHAgO+qlDMsEyykp9dsTKH1Scf
         9icfUDLv+Midjrqaljb5dkS5I1UONGRXp2t5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738748301; x=1739353101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c3hH/C0ty80foBKuB31iqczubI+r+OraZ1ZxIaqE7Y=;
        b=bm4KCobWnfqQpkQuX5KsUCRxm4V/DbsGOrJlabrMB1/Iallvz5qoln5ijxca9qAVxJ
         u5+V/sLpncWdwd8g6uPP2pYdYA8LySoSqfV5btSdDfrAZHDrpQIQApBttWLuO/cX1wO9
         DRi/bGdWOrpGP6qoAQ3KCpVqpLQKJWbOhbah4qpLDa6+3L7w2xUQ4boOubLtxmhnmaHZ
         JhJc6E7j8kZvhL7iP3b7ynHbnxWFhkoZ4hbZ59xqsL82W7KSZLLNE6TFUY3aCqRXMyQu
         Fw/p7nAgANIVYzP9yj4OAAm0KzmpkyG9t2XSfzKZMxJNvRjGteb3iqN129kx6CaVphw4
         Ydcg==
X-Forwarded-Encrypted: i=1; AJvYcCUu5uWTRC97xKtcUsFNrEATwfdTdlnSaGuWGFfO77rPVqQ4Qgm9kIQe6eMORNF3ltcRluHjD4RVV90DdP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGXvtVQWnaDYEb9xPsYL40v9PX0K/UZNdwoXvLjU39k4WEg1z4
	VVYLe2qRhGPWwBy9CssAzPSYtjd6nC3H6VS91BEktryan7f7tUK9P3bTSIQJDpo=
X-Gm-Gg: ASbGncsMj56FuMfIGjdn+4RI2pQCGOdDknVuSjeX5/AQKnyiHbH6OiVZaidUlEBW+Eb
	TttEA0gr98dLLHZ8zzdNPmlaytAWaGAaxNn/wgA4nX/CLkHjga351/kz4l0N6b94sqoVHd2fYOW
	v2w5uG5PyERQtb3ZwkRs5GSBfJ+5WfyU1PkuG+57QtcJax+XWnnRzV7fO3AmfW+tbRq56HsYsRL
	y1ZvLoG6+B9vtPyJsJbadbken2BVqQ05IR3IZ7MwmjD7wu6InDBh7LnmqspKGMbbkoypftv/94u
	nTxdC0/Uxpl4xinGvrNWqavv0ZVW4gNumEX9RdxhxrjM64WGHshrbM8=
X-Google-Smtp-Source: AGHT+IGKiCTY7NdXJy7RVGHpio2VSFkQcy1N+pRmbgyKzcOOLI6LKDmi0Hp5/VBrGDDXcgZfdTMBvQ==
X-Received: by 2002:a5d:47cc:0:b0:38b:ece5:5fe3 with SMTP id ffacd0b85a97d-38db48a3fbdmr1234354f8f.1.1738748301323;
        Wed, 05 Feb 2025 01:38:21 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db0e2f479sm3061238f8f.57.2025.02.05.01.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 01:38:20 -0800 (PST)
Message-ID: <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>
Date: Wed, 5 Feb 2025 09:38:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
 <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2025 9:17 am, Jürgen Groß wrote:
> On 05.02.25 10:16, Andrew Cooper wrote:
>> On 05/02/2025 9:10 am, Juergen Gross wrote:
>>> xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
>>> most only once during early boot, is clobbering %rbx. Depending on
>>> whether the caller relies on %rbx to be preserved across the call or
>>> not, this clobbering might result in an early crash of the system.
>>>
>>> This can be avoided by not modifying %rbx in xen_hypercall_hvm().
>>>
>>> Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   arch/x86/xen/xen-head.S | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
>>> index 9252652afe59..4378b817ed32 100644
>>> --- a/arch/x86/xen/xen-head.S
>>> +++ b/arch/x86/xen/xen-head.S
>>> @@ -117,8 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>>
>> The 32bit case, out of context up here, also clobbers %ebx.
>>
>> ~Andrew
>>
>>>       pop %ebx
>
> It does not, as this part of the context is showing.

Hmm, so it is, and worse, it can't be changed to match the 64bit side. 
That's nasty.

But while I'm here looking at the code, what's up with

#ifdef CONFIG_FRAME_POINTER
        pushq $0        /* Dummy push for stack alignment. */
#endif

?

That's covered by FRAME_{START,END} normally, and Linux's preferred
stack alignment is 8 not 16.

~Andrew
