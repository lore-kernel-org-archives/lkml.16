Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916311E7C03
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112543; cv=none; b=b6DNnZsBEXcrIjUHnC0DxCTq4l+tx3kiKoSdoR3I4lqrqMDbcN/kRecWNSXv3Qvb+s/mc+qXLJ0EcBfoNODqJg93l724V8sHXvWq85UWe6R8YGI3Fa3HVDyxB8RqXFsUfbkc1l83g0weUpMeirl5CiI088YJySpWeJbyrHAr2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112543; c=relaxed/simple;
	bh=NRoDy9oPqPmwUYRp1IJc6lJX14zHgjomcJR0myjnx68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXwwsYvJOpFZx4mAUQkBjgcvhD2HiMHwr8BkwDtJdFKNg1FUnKA8iBykd4cM+3Fkbmx8LNFh09xTVOwyBvLacY+1QPWpLDNF+p4D757TWt/JGLsAtPzBO1RhpT7gQen2o6+FBqEHjAycaEz4+cEnPSegRfRTtfBq4jtszfmCfr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T6r3fFS6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T6r3fFS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749112540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7OP291cCHEccCOVb5GqF2fJ19heqtSc19LUMzhHmhc=;
	b=T6r3fFS6X0wfn07ShrpPgNhij8M11l1pnKrfkTy3Anp97hEWFAD0oQAUBUZXQ4guHz+0r8
	XmGeL2kBj0f6TIk5kQdiT/Kpi3yoSdzoQGuNbaPx7C9bqpnDoHt5tczapgl/xCqME53I3P
	0KuGB+mhN3X1gdn35RodWCrTBXohNrc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-gLZEwW_RMiiTY24mWWeMCg-1; Thu, 05 Jun 2025 04:35:37 -0400
X-MC-Unique: gLZEwW_RMiiTY24mWWeMCg-1
X-Mimecast-MFC-AGG-ID: gLZEwW_RMiiTY24mWWeMCg_1749112536
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7398d70abbfso1364540b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 01:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112536; x=1749717336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7OP291cCHEccCOVb5GqF2fJ19heqtSc19LUMzhHmhc=;
        b=PLXVKO5k2xMn9wvrM/bQWZmKssQ9QmvFsDQL68h5gxevPJOP+qdtCYs+gNh7mTJPtX
         b0g2v7OfFG1NAZSKkrQs/QfilHJ+4uwCnvL6RjrTujHcgMeTyQz1eWwB6vbimnpBsqsD
         QZ1q9OmbuJ+k0rVxN2FDawSgnxGILBR3J29qrzqsArerSS+R2gcP3RjQR96seLRqx+Us
         OtvAFm+TFQrePEpzKHcQgJ+drEMJxg6zEfP/qBmpTFoFe8pO0A78dSa3ESDhAIaAM21P
         EyIuxvPlAAFH8DHbiypuiwhbFVr/mVMx8yYqUKnncgOVVvuvNXR0tGtvptv9hOaLw4J/
         ap0g==
X-Forwarded-Encrypted: i=1; AJvYcCVBYTbZY2bzIYGXRFSoZGY7bf5uD+mnbY+adUL2HZGt/XzUdc1hyr9mBcQ8N3RKDIdOosMdewhwIaFvztA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyElG6JtC0zc5w6Hgeg7tHlLwZ1lokyQtNqLLE+G749trOAqeWP
	ZqFfT4vOWSeHZ/EWQqRLu+WppvSv1V+rQBrgZowMq7rfXK+OuqED5WAvTePPOnA6893R/8a7YTB
	3bSWKJMQoBHzn7ipqVGuOB/x0f1txGfmhhd1KxUiHTZ34BbQu9HDtBWWkmJiPm5y2vQ==
X-Gm-Gg: ASbGncvPzaKV1R7xWL//hx/orp4ldjpuYCYenom/HWl0MxHukgoZIYjttQ8+C8gowMN
	Tr0Vla3F4J2iV/q8vaaKdIv4iNYdNHraXFf7KYP3n/TCgmK3f08z/Nft9d0bxmNCxguOuElwtKr
	JSuJSfZI5OGdoblC9KF2QX5SGq9rEvanb/iqltjXu4MHSXQNsbogkwKAlsdCRBlJP64MetY8SJn
	h9GZQHeKJNCo2NPzorX0A48SPbfH5oafCOWKW22RXkW/kZ5cod+5J2BG39GnHIeXD+XINkKEgsp
	8Js=
X-Received: by 2002:a05:6a00:23c6:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-7480b2e0361mr8190445b3a.12.1749112536497;
        Thu, 05 Jun 2025 01:35:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrN0PqOUdKalMaeAG7aIgHJtiglVXWjEwD24TEHI4LYox9Gd70kryUZzyeMjHmJRalEgOnRg==
X-Received: by 2002:a05:6a00:23c6:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-7480b2e0361mr8190429b3a.12.1749112536110;
        Thu, 05 Jun 2025 01:35:36 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab75csm12734762b3a.52.2025.06.05.01.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:35:35 -0700 (PDT)
Date: Thu, 5 Jun 2025 16:34:20 +0800
From: Coiby Xu <coxu@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, keyrings@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Peter Jones <pjones@redhat.com>, Robert Holmes <robeholmes@gmail.com>, 
	Jeremy Cline <jcline@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 1/1] module: Make use of platform keyring for module
 signature verify
Message-ID: <ibosm332sa2kz6vqrru5qsfk4tybsxepo4vascc3zsetmyckvv@pml7puc5jyl6>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <20250602132535.897944-2-vkuznets@redhat.com>
 <948f5567fe4d9ae39aa2528965f123e42bf82b46.camel@HansenPartnership.com>
 <87r001yzob.fsf@redhat.com>
 <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>

On Tue, Jun 03, 2025 at 09:03:22AM -0400, James Bottomley wrote:
>On Tue, 2025-06-03 at 10:52 +0200, Vitaly Kuznetsov wrote:
>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>[...]
>> > Also, are you sure a config option is the right thing?  Presumably
>> > Red Hat wants to limit its number of kernels and the design of just
>> > linking the machine keyring (i.e. MoK) was for the use case where
>> > trust is being pivoted away from db by shim, so users don't want to
>> > trust the db keys they don't control.  If the same kernel gets used
>> > for both situations (trusted and untrusted db) you might want a
>> > runtime means to distinguish them.
>>
>> I was not personally involved when RH put the patch downstream (and
>> wasn't very successful in getting the background story) but it
>> doesn't even have an additional Kconfig, e.g.:
>> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/commit/03d4694fa6511132989bac0da11fa677ea5d29f6
>> so apparently there's no desire to limit anything, basically,
>> .platform is always trusted on Fedora/RHEL systems (for a long time
>> already).
>
>It sounds like that's just distro politics:  RH wants to enable binary
>modules (by allowing them to be signed) but doesn't want to be seen to
>be signing them (so they can't be signed with the embedded RH key) so
>that gamers can have performant graphics drivers and the like.  Thus it
>mixes in the db keyring, which usually contains several Microsoft
>certificates and also one from the ODM manufacturer, so now it can send
>would be shippers of binary modules to those groups to get them signed.
>If you only have the built in and MoK keyrings, the only possible
>signers are either RH or the machine owner ... who isn't a single
>entity to deal with.  Personally I think this is a bit daft: Debian
>manages an out of tree module infrastructure using DKMS and MoK
>signing, so I can't see why RH can't get it to work in the same way.

It's interesting to find that although Debian's wiki page [1] only
mentions DKMS and MOK, it actually has the same downstream kernel patch
[2][3] as Fedora/RHEL to allow using db keys to verify kernel modules.

[1] https://wiki.debian.org/SecureBoot
[2] https://salsa.debian.org/kernel-team/linux/-/blob/debian/latest/debian/patches/features/all/db-mok-keyring/KEYS-Make-use-of-platform-keyring-for-module-signature.patch?ref_type=heads
[3] https://sources.debian.org/patches/linux/6.12.30-1/features/all/db-mok-keyring/KEYS-Make-use-of-platform-keyring-for-module-signature.patch/

-- 
Best regards,
Coiby

