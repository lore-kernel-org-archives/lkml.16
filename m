Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAA2116E0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727951; cv=none; b=UO6u+w9bNKpHphB3m6dQSBac7k1R8UV56ynX7ZjhpzFUFGh/wXIlXOOUdooLdfc8drAd9KYP+Q00qnLI56rxVV6QyEXEnWZh9Tsd4h+1uqFb+kyFWz9pmk4QHqwx1zLN1epjrQIxUNiGIATkA6/JrPAoUKk8z0lkXwnDkBTZmqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727951; c=relaxed/simple;
	bh=Ln8Xsvd3N5Hw4TUt2qHdWEqSjFP3Z+J968tVF6I37Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SU2cXp+p/WsTe9G91H8lxgSNTJssN3gLnyuZxKEkG/gESsINQPre75Oh5bylqedcjpyon28ri+hVszuDeeo7FsffK4bcGePGmeK5L/mReePoNyLk/taP2qGAd+F/8L8HTtNSj3Ts5m8DPtRdsnyf4I6EmeKzDJ4Lt8yMrjpN12U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XItTF/Eb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XItTF/Eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747727948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xu6VvED+PoElv/mNcoKB85P9VgSxTAqocoeIrFfvu/o=;
	b=XItTF/Eb7Mlzv3wJyXD1v85C4OFZ0y4eRZGrzOTbepkrb7aQUFjz852ak7L0HHWO02keAj
	ZAepk8Kcew7JfnRlgD1HNSP/x80YrcoVr/79sKsTf137Mj0L/qn02guEZaof0RerlBZEw0
	g3bF2h1NZFVS/SAJ+3affTnySX213Jw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-UsFJuh_UOFWZelNu-e-L9A-1; Tue, 20 May 2025 03:59:06 -0400
X-MC-Unique: UsFJuh_UOFWZelNu-e-L9A-1
X-Mimecast-MFC-AGG-ID: UsFJuh_UOFWZelNu-e-L9A_1747727945
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a36a4c70b4so890080f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727945; x=1748332745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xu6VvED+PoElv/mNcoKB85P9VgSxTAqocoeIrFfvu/o=;
        b=d1ZJQM1E1JNTSpvsKnY3Uw0r8NftcV7yAU47hL0yAYXLi2LLNjkxsOvT3++APBLmY8
         VHF9xpH1kyBYKeAquhuIgjzHoVlLI0YHIGUkUPb9GwRh3295y14wyIL3SKYt1qogp8wM
         10K/tRecQU+VuJZUjK+9e3VL7nRVysXewULZrdb0xSOPUlUZl6FlwxBuy0GOB+Oa6mBe
         mx1LGnaJOyB8JMj+JAm5W9FjC/jDKccQaN9SQ0kM4huCFXxZI25HNpdseYjkyyc8QK8y
         H4mD/PlRDFjwxdj7VDSwEfMRfY0gyN8rlWUnIGnKWvlaRxU8DQuwZKMHwoRzzIFq9npp
         ilWg==
X-Forwarded-Encrypted: i=1; AJvYcCWaMd97IHf7UI0lBs0PnJY4J0kXTYz7xix4leFZXr3a3SeCABDxNPWSqVTmqOKtybeQQXNtk7J3qzW2pmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBamtrgxfb66HujIWwURmUFKV8d0gXlR/epPsh+tnn3gQMWYc
	oyHRT7Qrg4GlNM/VITlT8uCEnCZgzsn9V9efunl100MyM2WMSotAVKh7HUhQrGV3jENRptFULt7
	JrtOVSgCSvOyMGjk6TikOQayI7OcGAO61+MX0sbHHPXtthakbqtRw/3KtZ+wgDkPzYQ==
X-Gm-Gg: ASbGnctI2aHC8VZhfDracsloGaVemJMKC6XWSAbDqEp3/uIcuqQPZy+IYh3wERdP+v3
	IS+Pov5W8c7ItNryfGnY+665fFDDze+xP1NccgKNPCYOcG3BulwagX2R7Ztz+7uBd+pihDesJnN
	rpvZI35Rh9Ec/TAZ68CSnTqJqq0pVpW84J3P3kK+LMDUk4bIOlCwc8SzSac26oOeAN/c24eob63
	MoDpVUQRLBenEuca73Iz1yyonOHDwbNbB8krp+0d00VhrSlKnX4I31IslmWyoOujGfZYi8Lw+wH
	I9kHJjFx7kD5wLGHmUPPbGl0faZK+ngIobO/EkQTGAzxCpQHcNbnhlyxF3g=
X-Received: by 2002:a05:6000:2908:b0:3a3:6c9e:1691 with SMTP id ffacd0b85a97d-3a36c9e17ffmr6618033f8f.53.1747727945381;
        Tue, 20 May 2025 00:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc5/i5xy+aD6gy/JpszOV8ylA+VdUGvB4VOQl1RBojQXejgZiG2fyh3K00wLwDiPqS0pH1Mg==
X-Received: by 2002:a05:6000:2908:b0:3a3:6c9e:1691 with SMTP id ffacd0b85a97d-3a36c9e17ffmr6618016f8f.53.1747727945006;
        Tue, 20 May 2025 00:59:05 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db? ([2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a8c4sm15274792f8f.27.2025.05.20.00.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:59:04 -0700 (PDT)
Message-ID: <a202f5ff-2ead-457d-8f1a-9f7ab5cc9243@redhat.com>
Date: Tue, 20 May 2025 09:59:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
To: Matthew Gerlach <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mun Yew Tham <mun.yew.tham@altera.com>
References: <20250513152237.21541-1-matthew.gerlach@altera.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250513152237.21541-1-matthew.gerlach@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/25 5:22 PM, Matthew Gerlach wrote:
> From: Mun Yew Tham <mun.yew.tham@altera.com>
> 
> Convert the bindings for socfpga-dwmac to yaml.
> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>

Rob, Krzysztof, Conor: looks good?

Thanks,

Paolo

