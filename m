Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60870800
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918566; cv=none; b=PdBz0CF5S/RS1diuBJIkcLPeHu+Y1HJuTqFh9cuwmY6jTVC8V5NK4dnW+0QSpqfMd6m0wg6i/wfl4Tq0rSlpnsW7A2YJ2W2t1crfSRtltenHHZ4dm27vkkbh8IcVr97RGpECvsSjPCa6lshH2UIW8/dafCxnzH0rvtTqV7Y2RQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918566; c=relaxed/simple;
	bh=NLgm3ww3YO6bjJtJrLFxAJyT6HFnEfsaguPcMB2rQd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+WSln8deD8MC9WyVBjXsaYv97Bm0zl3/tOs/cUyv+4s8PPehmFi5/05DrK25+uLiM887pOkgmVPiWT8iNHddcJWzu7MTpBIAfGCEmIpffO5OQUVQDrvUNiEHNmq4VXUkrhVCU+IVXnOQQN6qAKF6Pvd4axrLSRuV9mV5fLd4Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVcgsul6; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVcgsul6"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso11145407a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918563; x=1746523363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5ETyMiENat5qiMjmd1YZvsOVUVueP+Yn8LaPAo84g8=;
        b=KVcgsul62aBxZC6OQVYyF4mWH+6lzbjdNJq0DU/ItduhtT1fi+VXwOr62ffQQEJVeg
         8CTRguXUWLUPpq0+W1VF/pm9OsqOr5mYP99k3lEtcg+3o0PdAWP7HruKs5wdDtzhagQ8
         /TVkm2QO6mPoD+6bn0HfP9RaJgKMXZGeTeV3k7Ni+7RY2EFJpZy/hnl57PdyYYyaDmHR
         dgHb/LaL9yrLfLn7J5dMvjfZQ612m8G6rgDq9i5Ahe7ZN0i07Kgc4tJakRJslyiTX2eT
         juBr4+CWLdVzMPH6ML56adUIRwD2uYPcya5HKM1elMWh1G+68DG21Wt8xhHwd8NOjBqo
         l34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918563; x=1746523363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5ETyMiENat5qiMjmd1YZvsOVUVueP+Yn8LaPAo84g8=;
        b=ur8k5VMhTwnciv3IWlpZrXtW9FXa5YWM3R/OStwbU9IJBhrD0ttdts9VQlCq9zSpF2
         nhk08CRKDjXO8nRMkREj/NnWFgqpiW7ANF1tYC9Wxx9OU3dKiGf+Ca9MpCjzPLg5PAyO
         IvauutrDHmYTlO+L++N2LpXSr4E51fiBR9Biag5thKcMnwg+ODZPQ0EgeKolfDYq+j4K
         OCNwR9X3R1JoZY5e4l6t2Do0eBXIbB9q/BgJavvFHUUN1gPW8hwfnEHss3oapuX3mJ7u
         gX0jnhbKkrOBJ+azMu5g905jKfCDS225Shl1JYoz0y1rN3uV3F2i8uCtWztlLmm/O0Gx
         xOVg==
X-Forwarded-Encrypted: i=1; AJvYcCXyv3yhzfC3Xn3Sh5nOan3h6qn+zE9nI7Ah+LD1aOsY6f679TFP/hvA/cSZ+YHltBz1Pt3sqVWMk0aV9PY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywki/PwBLtj2DDxmtMI65XaoF2+Ig8h10udAEe1nPBqilR7BGhq
	y5aWUOy7lTy4uW7L6P5QKhdnpdSvP2yfzoJRSfKUBwuIT/7Zvd/uk/JGkbTajmILBtG6Ti9TALH
	K
X-Gm-Gg: ASbGnctPs14X3VRJWBxvFVOuBNWzYUPJDy+YxakmEj5kARM0hLGnJDW595QBM5VVnpz
	U2Bhv/CwS2/mT/JBu+GNTkZrqjPY+Dwzdd1LoJk1pazIaLk2f5vxwV3dMyPpsqHWRAnUwsjj5rh
	hu//f1Jrje4Bzst8FeoffQYVtFHzI5gYHMTbEmejCA2+H0LTJTbE7NWekQTKDbdrqkfMS7bEkjf
	uMfWIZmsvn0UKVA8AkZsBEhu1436Z66NjcS3eVXJvMJI1rBaHV37vi6/X0o0NLyn+nrHEI7M6eF
	bXHLv0zUiXJUml9ogm/C7KzGgWV/zK26D9IiAmUh2LQAb78wAQ==
X-Google-Smtp-Source: AGHT+IGT47/KY+DVWifRNKDHeFCplx4qH6Vau0eK+jyg2W7wdu+e7jzwFboA4F0/aGKRwgS/kS3D5w==
X-Received: by 2002:a05:6402:2b92:b0:5f6:44de:d97f with SMTP id 4fb4d7f45d1cf-5f83b24deeemr2182482a12.25.1745918562886;
        Tue, 29 Apr 2025 02:22:42 -0700 (PDT)
Received: from [192.168.0.14] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm7340433a12.46.2025.04.29.02.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:22:42 -0700 (PDT)
Message-ID: <10b40148-b949-442d-9d43-0db09517269a@linaro.org>
Date: Tue, 29 Apr 2025 10:22:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
To: Luke Wang <ziniu.wang_1@nxp.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, Bough Chen <haibo.chen@nxp.com>,
 Han Xu <han.xu@nxp.com>
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/29/25 10:03 AM, Luke Wang wrote:
> Hi Pratyush,
> 
>  
> 
> I'm following up on this patch series [1] Avoid odd length/address read/
> writes in 8D-8D-8D mode. While some of the series has been merged, the
> patch 4-6 remains unmerged.
> 
>  
> 
> In fact, we also encountered similar read/write issue of odd address/
> length with NXP FSPI controller (spi-nxp-fspi.c). Currently, we handled
> the odd address/length in the controller driver, but I think this should
> be a common issue in the octal dtr mode. Was there a technical reason
> for not merging the core layer solution?

I guess I stumbled on those small comments and did not consider the
greater benefit of taking the patches. No one cared and we forgot about
it. Please address the comments and resubmit.
> 
>  
> 
> [1] Original submission:  https://lore.kernel.org/
> all/20210531181757.19458-1-p.yadav@ti.com/ <https://lore.kernel.org/
> all/20210531181757.19458-1-p.yadav@ti.com/>
> 
>  
> 
> Regards,
> 
> Luke Wang
> 
>  
> 

