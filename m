Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314FA1D2F42
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307661; cv=none; b=luauqgEt+H//HyiFMdD1egNJje0U8BZsDtAQsSaf3WVfuGTQrRsJcKLYd9wpjB8rKflFP4lgUgFb8wSUYlBluSFl6oldkDWgSZ4iyJp84/JP1DMJyNgsSVTSZ/ZRDq9Z9d6wIo0eLR1PS6dMuBtUmG7ix+TpCPCBSYRsgG6X5UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307661; c=relaxed/simple;
	bh=FN3aODM/Vs2gKGwui2su2aD9kUgy03QHDadlp9UJ5DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/VEfO8p9xhLrDFyuSEVRi/VGez3o50sS+JHmq+KjgbwHmc9bjegN+L2rwDU48Bl02VUP9AcWzIyAtHb9d4zyWRkuwq4Wpzya4C2YQx3LpUCRd5O9FkkQQOrzaIZbUf2pnjvN6bFjR2epXsPkrbOLsCnCHWovt/2yveEIgHjHXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dq4LbKbY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dq4LbKbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747307658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fq//g9rX4/O4lr2yu6IflbnOwjCV+MJ48Zq5nGAklT0=;
	b=Dq4LbKbYgVWPynb0LBRxqB0NS4OhdiSvprLdb7BBg0gIV/wBj0mgANevaHcW7CG2b9Znhq
	dzSKGldmEYMjlDOaRnT2S8h30XtrTd52VeGrVkgEVeBBCbHGaZg3PDhpqQxOzU8dgyyA1J
	IpCgj285xvveFXdPenxEKTnOyVnxa7k=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-I5HRswBbOFu-wlGwbMhJSg-1; Thu, 15 May 2025 07:14:16 -0400
X-MC-Unique: I5HRswBbOFu-wlGwbMhJSg-1
X-Mimecast-MFC-AGG-ID: I5HRswBbOFu-wlGwbMhJSg_1747307656
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476870bad3bso13663181cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747307656; x=1747912456;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq//g9rX4/O4lr2yu6IflbnOwjCV+MJ48Zq5nGAklT0=;
        b=dVNdcWYh01QY06lueHrzAeT+NI2A9vWsCCMSZ7zmvqxyy4/iiNfvDxEPktgUzsebHN
         1o4aUtDpF8TRX68Wnls1O0qQQrseFDYY7Qov6vnNKhty8NYlavZIvSperDxco6iC2E/u
         Fq0az1HfQSjjaAXIcKJ0l5Dq0V/9EBxfeTHdWuV6zq/xWSBThHQ59qB8LY1O2p1vuCcQ
         Fdytid8rt4E/yfSbtzZBTrlk5BF+NvaAVu3t02C+O+GMRuw1QBbcnk6CjEkkMSh8n+8u
         T1BUdcD4YDO+5/ZV9J1AC/TVgk4rodfOaS93oCiOcpw8C9MCmJCDblxmKyYSrazpN5i7
         s+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbxZkGepEs3AnloBxQ2didHxbTuIx0mu8MtYufaRZva8n18gQnLikrY2r76WjHL/iFA1PCTWyzMydn+GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJjYj6oSTRpIGFnU47QLux9HI4xNaIAXkzsyCH8K60IKgdV7L
	wgTF0LhvnbRQ4A6VpDd6n3JLC61HfKd+FdEdNlpSLOwRtbcDe8kKxJdKo9ZOpsypEGahq0VosOJ
	E/pICHZoLS+GQHN50bicehqQ0iu7wJHfSaUoOClI8DxoHdwOWEFOvR/0oQH1lrQ==
X-Gm-Gg: ASbGncvaFb7l9qpESM8tKoQYtQs5NzfCyIrXvdcpreiHMTD+I+qhaadAPtwbIZTUuh2
	666DX0Ubw6ghTXxarZnRMhv1IITizYRh9i/8IDLS7xAvZjFk5AoVhKR/ItQJGNX83mvt/wIFRAz
	KxuFO/qJoo1taB+E9sZKyNRT1Cepk3qnXpUiBGUOFwEowU2e/FsR3rc/nS/sXMu4U1f+bMxjINw
	kFCmKlW+zUDqKBazzK3wOf35OHqUphaP4IgCOpoKKUrjPWrYh6j16pfWZmwOpKbA0fFnFX2FHHO
	jQyFT8rvUuV9+o75pA==
X-Received: by 2002:a05:622a:5c85:b0:494:a36c:ebd7 with SMTP id d75a77b69052e-494a36cecf8mr42288451cf.34.1747307656405;
        Thu, 15 May 2025 04:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEfTCS9krxzm9V1zvy13K07KTUSWtp+SYYN9LDtq+WtCDlRCR1m6JLPfOFtf6DuMKdBCa9ZQ==
X-Received: by 2002:a05:622a:5c85:b0:494:a36c:ebd7 with SMTP id d75a77b69052e-494a36cecf8mr42288061cf.34.1747307656127;
        Thu, 15 May 2025 04:14:16 -0700 (PDT)
Received: from [192.168.21.214] ([69.164.134.123])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4945258789asm93276011cf.49.2025.05.15.04.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 04:14:14 -0700 (PDT)
Message-ID: <bbe13eae-63c4-4f1d-b510-517d5e8d6a28@redhat.com>
Date: Thu, 15 May 2025 13:14:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dm mpath: Interface for explicit probing of active
 paths
To: Christoph Hellwig <hch@infradead.org>, Martin Wilck <mwilck@suse.com>
Cc: Hannes Reinecke <hare@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 dm-devel@lists.linux.dev, hreitz@redhat.com, mpatocka@redhat.com,
 snitzer@kernel.org, bmarzins@redhat.com, linux-kernel@vger.kernel.org
References: <20250429165018.112999-1-kwolf@redhat.com>
 <47dd225b433b0df585a25084a2e793344eeda239.camel@suse.com>
 <aCIRUwt5BueQmlMZ@redhat.com> <aCLe5UT2kfzI96TQ@infradead.org>
 <0340c51e-6f89-4799-b2f1-19c785a19ff2@suse.de>
 <aCLjPLCztuXhgpnA@infradead.org>
 <d2a7fa68-1890-4367-a2ac-59ec220779bd@suse.de>
 <aCLrbz3bRLwUbA8p@infradead.org>
 <265961162cf0747a82c66c6cae38aecb85acfec9.camel@suse.com>
 <aCQh4NeXtLLCQeVN@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aCQh4NeXtLLCQeVN@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 06:53, Christoph Hellwig wrote:
>> And no, passing the SCSI devices to the VM and doing multipath in the
>> the guest doesn't work. The transport layer isn't properly emulated
>> (bluntly speaking, we have no FC emulation).
> 
> Then fix that.  Because without it you will be in never ending pain
> due to impedance mismatch.

FC HBAs don't even expose enough of the protocol to actually do it 
sensibly, so that can't really be done.  Hannes tried.

Paolo

