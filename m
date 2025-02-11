Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B1E1FCFE3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279299; cv=none; b=KmO7Yvt4ZzgFOvcfl4+/qEsYrkHnsu/cxTcpKiNJUrNrdMIUbPzAj2IQjzIG3ehf1XNq47PvLQRPs5p2awj/F3ab2x2ecbv3sg34FqDYT50mZSBELEmqYesbFg6ClB0DCc6Hf4KECr7a0WiVpOHGkAVt52R/ev2BWlhwmHB5w1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279299; c=relaxed/simple;
	bh=/RWwDCgWIvfRxCBNDmFnORoLKXqc+sVPbPIATI7AWBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWLbDkNvCQOBWCVdKaZZx3ExQ93i7Fwy+CvO7sP229pEs6pOKGS2pFIxFCnKNNIl0FCCWThOAdsRoS83bqrz2EFoavSKWxtb/WULAVk9HulQvSNbMtFmGOFD9a7q+o5bk/DXz4s70Kbprvi0S7iKbbhK5af5kQZ+tw/HylMProU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hbrvKE0N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbrvKE0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739279296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KTxPyDdb2wxiihdhjpasEWTWWdsjHn10mmqL0GFzWvs=;
	b=hbrvKE0NjMT8OYu5zFJw99+3QAqbJEeS2lVOiBwz7GEeIiPYzuct/LjJ3f9bPgpUknELBG
	9lmbeB12nYEwV1G+TFLFI2rje2OFf3TY2f5Q66sxeF6oRO+FPrIbux2uDRO7Rw5OeTX4Bd
	8dzRWw3WhrIqYhdGD6T6C1qlSee+9hM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-uRp8Y--LO7-kykev9ygL3w-1; Tue, 11 Feb 2025 08:08:15 -0500
X-MC-Unique: uRp8Y--LO7-kykev9ygL3w-1
X-Mimecast-MFC-AGG-ID: uRp8Y--LO7-kykev9ygL3w
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so11250925e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279294; x=1739884094;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KTxPyDdb2wxiihdhjpasEWTWWdsjHn10mmqL0GFzWvs=;
        b=Ms6L8WIvSb1XIWu/rUzblLxAdbAcGOJJ5NpI4kGG8eSg7ZjEtRbKtdkM8dxtRbBoNs
         kZDLYpDewN1WtHcmd+az2gVLxF3FpG2tnqwTOWte2oeX/yDYnoimeLJFkmFXAMSm70jk
         H7ooUSzEtn/B0mn2McWdbv7YYLPvXdnbJM8Aaq5JoAGsOF/qvyoub/PIT3EwEdurOAbj
         9LYqXO/8JlzHZ3xbwCaitTRbC+PLed1KsudSmPQbfiuWm2YZHSGzebmTOw9GnWGL0NVI
         r6NJW7HgG5xEgOz8tiRa4y1+m4df7/BsEUEDk2GZaRk97dQkpvxIDi9YU5PzWht4gGed
         gKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1eCNuE6O8JGspSdQS9toOATwZ8Gc7zF+EFJKsZMrZrjBXLg117UXlDMf3VtU8rVTvea/ii/cXXeQOsbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO4K/eajxq+dI06JnFWBLM7HmVcE8Pz1Y+gfkA4VuiKmqaDpK7
	0et3rCjdx6ifqN9WixCnRD8NfnQLQFkwvqIVU+7wFsuO1Tf1D8ZMBlB6nUgitnRS4QoavQPWer1
	UqLIDX2hJ6gMt7912zn+lVHs3c44StA7LRdEBqQUjU8HDrZ/utw92UIRy1RTwsA==
X-Gm-Gg: ASbGncsMnwwzRzSajW42djKIGmNAWG1GwRBJ7cneoVnIbsMBnD8fVuL6pPmWWWtYXS3
	3XlmxIoFPScLqht06HNUTSXMcfXR+9hcWso1nAKX8BOQeFTNVli+SmFxa/OVIlclKs5l2Za4Psp
	cFAuQ3Wr4VzMhX3pdDO7BOYri7PB/82Y0YEpVTh7z7VcNoFLR4fjaXfDYox8JLyzTa4rzkMN/q1
	fZ71DDMftWOyDcXacUGAtI4WWg0+i2OgjBaQyeHfL4Cykyu+vpAwubf6pP549bd7yRBu3yYjrtE
	/zngNSsHqNbJaMu7laR7YLKKpGd56Rqvb1E5OYw=
X-Received: by 2002:a05:600c:3b1c:b0:439:488b:985d with SMTP id 5b1f17b1804b1-439488b9a27mr60819805e9.4.1739279293918;
        Tue, 11 Feb 2025 05:08:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf/drif5hPNe2I0N6R4vROc+jEbwvVIvaQdzsYekSKWtj0FR4Mu+MdWbvn9S9v4+doZaSkgA==
X-Received: by 2002:a05:600c:3b1c:b0:439:488b:985d with SMTP id 5b1f17b1804b1-439488b9a27mr60819475e9.4.1739279293603;
        Tue, 11 Feb 2025 05:08:13 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm180879475e9.1.2025.02.11.05.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:08:12 -0800 (PST)
Message-ID: <f26fd867-d348-40cf-ac55-023ac814cc50@redhat.com>
Date: Tue, 11 Feb 2025 14:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ACPI/MRRM: Create /sys/devices/system/memory/rangeX
 ABI
To: Tony Luck <tony.luck@intel.com>, Robert Moore <robert.moore@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20250210211223.6139-1-tony.luck@intel.com>
 <20250210211223.6139-3-tony.luck@intel.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250210211223.6139-3-tony.luck@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.02.25 22:12, Tony Luck wrote:
> Perf and resctrl users need an enumeration of which memory addresses
> are bound to which "region" tag.
> 
> Parse the ACPI MRRM table and add /sys entries for each memory range
> describing base address, length, and which region tags apply for
> same-socket and cross-socket access.

How does an example in /sys/devices/system/memory/ look like later?

 From a quick glimpse, I am not sure if this really belongs into 
/sys/devices/system/memory/, but I am missing some information in cover 
letter / patch.

-- 
Cheers,

David / dhildenb

