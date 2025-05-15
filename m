Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143AC223DE2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307374; cv=none; b=BfOXcvDitfY0RSF3LLLPTwM6OxtA//QM1hnoJKM8wuKkNAkAAQUSYiXlfGoabtDldPQn/+SYNfwnDvIgqjOLYsVnDRbgmiEWTuQ2z+jmhuzyzGdZhQQamK0Bzq6XuFd/7TqDaeT3AOhaUsFJ66+SxAbkM4yZ3OYjWTKWHAT4nwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307374; c=relaxed/simple;
	bh=2j84STCDm0vREYtgZ6xSL2ryhUkBXmMAz8HL1cnzyQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trSTK8ak1aVmqbsTZ4xL4TjNHnTW9DFMiORjS9ToYC8bVnWAA/dNPq/f8QwbdxqgTugK72MIFDdvEIm0p32bREy1VkVLQ8P2geA9JVUcUQLRdKeuzXoqFtgKx+1rSH6S+L+FZ9IeJ3Jqecpmy90x7ZdVY0QbPq0cbvqlzpVGvoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWU8HLSZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWU8HLSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747307371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JRR/RELLFaGmt5TsP7eVtXUVpGFQlMlBD6NeI0Bmw3Y=;
	b=LWU8HLSZFVSulCNVF+NNfX/HRkVtYtOCJsUV7DeKmtNAY6zU33JKcdcrWqZJ6yPhsOMW+T
	W1FHlBklkfiBQCqr/Q3VQR2aqBeID+thIU7MGgWomhFp3XFRQZ4v4Btq5x57yVzQ5Mo2qA
	Yyfy57aMohCHeDgr4ja/ZAQl58X+Y4A=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-v8su1HgIMDacP1eP6JAwsw-1; Thu, 15 May 2025 07:09:30 -0400
X-MC-Unique: v8su1HgIMDacP1eP6JAwsw-1
X-Mimecast-MFC-AGG-ID: v8su1HgIMDacP1eP6JAwsw_1747307370
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47689968650so8937641cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747307370; x=1747912170;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRR/RELLFaGmt5TsP7eVtXUVpGFQlMlBD6NeI0Bmw3Y=;
        b=ZFlLvNgvu+OvLbv3dNxYwp2H3RMCtyXw/0CH+wq9YsQINsmjdEpiIB5rGtyxnKvB/w
         U0Z2D/U8V1rSS76UVkvKWLbVlXWez1T6qbiQTTSAF96/j7VK8zJ7SHWO4WxBUJMgYpSu
         g2j7LxZCf3iYgFVvQJasWHyHbtcxdoX5wn+SHH2PWMyQl+wsrZhMTO3rmENINHmWpYFi
         n+i+sFcDaS1RVRRJiRvcpvWFnHaTd6VXkVybNKsIeiD/zbzpXSgQDjAphp7xF1F+hcHu
         21x1g+U7c5j2cqKy4iGLtY7ngvL7CgxiWE9abcBKleKpwiKpuDKkCaBcJq0BdjUH5x7j
         HThg==
X-Forwarded-Encrypted: i=1; AJvYcCWdexYXjSDWMwoLFXD6iPkTqsB1W4ItuVIJvshYuXCGdKY67kiVhD+P4T/uOpfm3X61nyca3PlSTxKNa84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygp5cuGST4b9WSeVw9cVcjDEyhzd2bxWnm2wYyRmtb3QxcyP4U
	OrKdaCKxe5OC33kNSIt0fOEfyvQGAaf5eYBAG3Cai5d6PTlbQ/TbfLPcTuamcfzWVazzPlN4HNB
	zGlD9GpETz6LOXBlx6Bgg950jk1a8FkobMv+O/Myo2kBKMkJerOiNNE90xnM5aQ==
X-Gm-Gg: ASbGncuMI47xTZybELoJ8Iu3w8XdMWEHZzvY2GFLBLV9QrqVwQrpQLgJntbZSiOeLkv
	l53vwo8gKAmsAe7PzSZecYUwijadKotbZCoCJy2FXjRl/C1+i4P/PFY77rhVLLC+UOVJWcpLIMk
	y6IG8S8VigZBLutGxnWi1jyLNM4ztBL/n5Y9g98dGx5RTk+UZ4FPwhBHK6HXyftB/ZsHilKSuCO
	FC9oxrgpWlm1Y3wrTi5KgUTCmKoeqCA4dkrw9V8U5mJdVE+SzVZCXZPescpzPvV4plzMico9tmV
	U7jh1biNmDvVw/SyYg==
X-Received: by 2002:a05:622a:1e11:b0:476:c650:9839 with SMTP id d75a77b69052e-49495d020ecmr104492801cf.51.1747307370124;
        Thu, 15 May 2025 04:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFms0SmEnYQMTyDvj/1zyQ6HJJbttnxjklBEGCUrbonquaTHXDdozao+AhCWetPjvq3/uAuhQ==
X-Received: by 2002:a05:622a:1e11:b0:476:c650:9839 with SMTP id d75a77b69052e-49495d020ecmr104492411cf.51.1747307369613;
        Thu, 15 May 2025 04:09:29 -0700 (PDT)
Received: from [192.168.21.214] ([69.164.134.123])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494a4facf77sm6054871cf.59.2025.05.15.04.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 04:09:29 -0700 (PDT)
Message-ID: <22f811d4-d327-41dc-9daa-7c4aa75a5cba@redhat.com>
Date: Thu, 15 May 2025 13:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dm mpath: Interface for explicit probing of active
 paths
To: Kevin Wolf <kwolf@redhat.com>, Martin Wilck <mwilck@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev,
 hreitz@redhat.com, mpatocka@redhat.com, snitzer@kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429165018.112999-1-kwolf@redhat.com>
 <47dd225b433b0df585a25084a2e793344eeda239.camel@suse.com>
 <aCIRUwt5BueQmlMZ@redhat.com>
 <d51d6f85b5728648fe9c584f9cb3acee12c4873f.camel@suse.com>
 <cc2ec011cf286cb5d119f2378ecbd7b818e46769.camel@suse.com>
 <aCW95f8RGpLJZwSA@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aCW95f8RGpLJZwSA@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/25 12:11, Kevin Wolf wrote:
> The thing that we need to make sure, though, is that the emulated status
> we can expose to the guest is actually good enough. That Paolo said that
> the problem with reservation conflicts was mostly because -EBADE wasn't
> a thing yet gives me some hope that at least this wouldn't be a problem
> any more today.

Hmm I'm not sure about that anymore...  I was confused because some of 
the refactoring of block errors was done in 2017, which is around the 
same time I was working on persistent reservations in QEMU.

However, EBADE handling dates back to 2011 (commit 63583cca745f, "[SCSI] 
Add detailed SCSI I/O errors", 2011-02-12) and yet the Windows tests for 
PR were failing before QEMU switched to SG_IO for reads and writes.  I 
guess I have to try reverting that and retest, though.

Paolo

