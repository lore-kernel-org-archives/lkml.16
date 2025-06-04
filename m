Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AB1DE89A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056168; cv=none; b=RdsfwJ+bNU3dakg9wpCaMfkCkvfmIYrMvN7tK31Jb/LFw1ZNU9ec49FX8JsSK/+WtKvfroy0uwMlBqWL0WR7y9+lRwqd5QZyifTjKjxrKSfIwAIGfbmFFQYUegpVSz9YRldxJhYU9DwLheSb4DtM8mjqJ1kf0QgkSRDXJcA3pqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056168; c=relaxed/simple;
	bh=guOI/IMUZQ9iLqAt5X6Xtn9qc6QdSHzu5FrWDlK72OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEwbrPhcRvGydzMMH2NCGQ3ypJ48XPq0lPzCRC83xu/cNoe8OzmpMIW3RZM5PMZKQ1ZHBLoXd1pjwj2vOQrZ7UzE+f/6Z+Nxq7ZwSB74eFlinVX2HAvPb7XaZQILwFCzeKHcI3giSvFxR+RDcmeaPO3CdCSNTxGkc1FmS43Txwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M2cfcRLB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M2cfcRLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I9PhEN/LIEN/gLsXY9mpqwVLXpzLhsWCN/lzXheaQis=;
	b=M2cfcRLBlqfGo0brHMN4nGZfp9ieS90r2jwSfszbo3pQ4zYgfFlggL7aGlKa5EfBMyFycM
	dk1qA4pAWewpr+yY9Zynf+XbIO0FJK61kzK0uJw0XNxP6bPzI3ykk4Cjt0fKT+W1vkaaRV
	zLcVdqh6aCiMIZ7nDiKQlEaG/+0SL7I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-Bzgc3vrpO2iHpFEXfRzTJA-1; Wed, 04 Jun 2025 12:56:05 -0400
X-MC-Unique: Bzgc3vrpO2iHpFEXfRzTJA-1
X-Mimecast-MFC-AGG-ID: Bzgc3vrpO2iHpFEXfRzTJA_1749056164
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so20982f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056164; x=1749660964;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9PhEN/LIEN/gLsXY9mpqwVLXpzLhsWCN/lzXheaQis=;
        b=jJ57wfi1+nAci5ui8WzJ9vTdnqrXrz71Rn+S7OtwyxVRPxLx5JJc9MVsLzpdMHXETf
         d+r/w5eold8A2aTKsY3XU973hb4gqiqDyrdB/wWer5N9xGLLBsefIRj5rLnuCoZK0qGc
         Xz8O6A4YvS6OgbvcCeim5VkuIEgtipsjtC+ZqSjAO7rvpUM6P3j9Y4XXbRubGtLtVSOu
         pS6QAl6ESa+/JIRsNA09MNwH+u4xZhBZDF1SqV15muieRHFTmnRzPieyBmjAMKXbZHMv
         JAu1cCc7mf5iJDzo5NcacAKujdXaEoidB45PJmyafKpv0Nj0wjwbYRAA0YYzhEJ0BAb8
         RAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZYLbE9zIPmEXtuTUxNSRooQ83wGWjTOsjtbLPBS7zWX98O6109cEXdKvSltYh6WtWSM2F0gMKjltPCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5rSU2zvJqV0HlHbmrsLKfdqn5TGEjqceCQzhq8avebZsY4jqg
	7GwdM2MymMHcprlnr1uccGaYH1tflKlwViQ16VxwF0PgAo4JQIl6nhXxDKYlV+4IsdWXhAptuLS
	rGu4oywwTNosprBmDHAK4/1QOiYfpCo9qeQTB+h609hTUtbLiRgggrMKyZCBNqNSbNw==
X-Gm-Gg: ASbGncv60HamC4vSdlAIioOCJff9yohbEOefZ/VDP1WeUnb9x32EqKofcKhFw7XyUTX
	bUEIFGLafXkHHswIXldUiPME5z+b3LWXyat3abtAEuJSYXa1AQB6TVA5touJfnA57fxeUonruyB
	cMAdY5f8fw67gNc9S11XbSm+dPGxvVtO2FCh+vAw0AszdFr+l1yv1GUO4gcjqeR2UR38YDxJ5iY
	LxPTz78Cqw6IJa5ZS9bXC2dkRxLK4EWplWb5+AjkdBjV3Ys2vT4UYaEs1Uz52jASsPymoviXlmY
	KqeSu3apF4H9dw==
X-Received: by 2002:a5d:64c7:0:b0:3a4:dc0a:5c03 with SMTP id ffacd0b85a97d-3a51d96a1ffmr3221286f8f.39.1749056164121;
        Wed, 04 Jun 2025 09:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS1/rFeCnYX1T3YAOENXA746Vcb7+JQHLYtoc/dOzG7V2U1TM7oVk/frUr9KrMyDQeVAs/Lw==
X-Received: by 2002:a5d:64c7:0:b0:3a4:dc0a:5c03 with SMTP id ffacd0b85a97d-3a51d96a1ffmr3221265f8f.39.1749056163705;
        Wed, 04 Jun 2025 09:56:03 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-451f82879d8sm1959195e9.1.2025.06.04.09.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 09:56:02 -0700 (PDT)
Message-ID: <69a46b99-83af-4913-b5ec-e993d2edde35@redhat.com>
Date: Wed, 4 Jun 2025 18:56:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] KVM: x86: Add I/O APIC kconfig, delete irq_comm.c
To: Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519232808.2745331-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250519232808.2745331-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 01:27, Sean Christopherson wrote:
> This series is prep work for the big device posted IRQs overhaul[1], in which
> Paolo suggested getting rid of arch/x86/kvm/irq_comm.c[2].  As I started
> chipping away bits of irq_comm.c to make the final code movement to irq.c as
> small as possible, I realized that (a) a rather large amount of irq_comm.c was
> actually I/O APIC code and (b) this would be a perfect opportunity to further
> isolate the I/O APIC code.
> 
> So, a bit of hacking later and voila, CONFIG_KVM_IOAPIC.  Similar to KVM's SMM
> and Xen Kconfigs, this is something we would enable in production straightaway,
> if we could magically fast-forwarded our kernel, as fully disabling I/O APIC
> emulation puts a decent chunk of guest-visible surface entirely out of reach.
> 
> Side topic, Paolo's recollection that irq_comm.c was to hold common APIs between
> x86 and Itanium was spot on.  Though when I read Paolo's mail, I parsed "ia64"
> as x86-64.  I got quite a good laugh when I eventually realized that he really
> did mean ia64 :-)

I totally did!

Looks good, other than the small comments here and there that you 
received and my "preference" for keeping kvm_setup_default_irq_routing() 
a separate function.

Thanks,

Paolo

