Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA271EB5DB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247185; cv=none; b=Rx06DXyGJdqKVzFHYV/60gRXOvbFvAcPHGFKLjtGEKk1CGpmurYZ/S4Gyc2ndLb6th8psZvXRtpG4SDnegY8icmlJ48X91jUSfO0EnnxJVwV9hX0RF8drULQVK+GJY6jMD8i/lCdzcmEfHRLrvvEelNhMjClT3T5uCzooHl0McY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247185; c=relaxed/simple;
	bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPQdPSXJFpTGf0dq03h0hOil4T+JFnNqnSAZ+Xyx5NCW7FNXtwNBjjzlstygeCS28Sj48+CAv5Et1I9G15TIM4daBZv1koti9a8ahGOkDnXo74LZIDErdtYuINr+Aw7b8DKoVGmnwebJzNVSqBO0qQWPSleZfe0ZqdtV1tC7pOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sd/xVPxS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sd/xVPxS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4dba2c767so261907f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748247182; x=1748851982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
        b=sd/xVPxSFGLvyz7LKqDzLZhGNXqoFKu7+ucNEgIKbRH+1hyeArcNCT1OW9VoVAOgBs
         N/xwIHI8Ch9pwVEFXW7ipYS2B6ri0EWCAw4eUNQCZGZQz809wf5ucyl3k0yJPnJ60uFo
         t04t3MssAPXRXu35rdMAM0bEhCNAFcR6UEKyugHhiw1Moj/5ERABN5JpgQ5P/kBoqVje
         kVfyYvo9hg+JBhpNO+WvIx2svOYPVRaVZHRrU2QL+WF3ThXMTxyPep05ZVx2jXT+CTjV
         HwL3+eQ1LDI/KNT+390leRj+lzUY6oj7Q6JTALTzmUvoJAGe3uj1V1OxNq7Mirv0aHCc
         fUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247182; x=1748851982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dMenWW9G9+jrd7FF1PAJg9qND6VwFxBlkOpgHYc29k=;
        b=KCPmr0RnfVd9oobUHsJUEwuM4RO8iFPMHlqJFLQ0EhH+wdlg2WOV1Z0VotiiZ4/5vs
         fwe/P3V515LIX5qOJ0k5LTfe6hGi+K8UEg/UMUDy4NrMDZAndmVK5no/V82O8OpIR1Yf
         P/Jmh1ouneqiZARf1/zEt/JGa/S8nkF4AZ+AOvocHXFD9U5z8nexGe9sAKtFxakRFLl7
         FNOEOB/0mhIVUfNVaOqs24BdJjMvPVGRV8SyV8ByEl291sRkKihv2vv9DUM4p3fYfo8J
         yJ3V8+UV4uHybaIAUXLAt3bgPv04unq02TL1/e6/L02bYidtKlj35QYTwBM8B2e8kBVM
         t3hg==
X-Gm-Message-State: AOJu0YwIh2RU95fTSmlvvXjKNu0ZkDxbkeCh2F9cIYzlYGOL6A2cCak1
	TIbEpdufTOibrugFTACfMSBAQflpw0W2mtwUFoZI6xS7ZnIVH/cBa/R3mlGn9OoCPF4=
X-Gm-Gg: ASbGncvxhZAgKgFyNyRHSrBAGOORRI+zGtf1Gt6LmhmmXtszapdFTh2v97lCPyePyAU
	jm49499p2ACJXuc/ljc0Ie5/ZfvZM2d9sheFX0472GJ9Ty854FbXCKJs0xOnvA3GKgNK3KSDNhh
	QgIf/Ow4NjB8+nExFogVXQ1zI54Sdzipv/QES69xoFOe79q/ISQmL8FcyTI65xUKmWVuMZHSrOK
	G3RQek8JZVtHURtzpDgahqOkcDW1xi/39Lzq/y6sUhHnNxeDxGkcM8nTGhc5xosKgq2N2sgyIHA
	3uYEnI42scXK7QDXK41GahErnENLkt1H1PgrDKwymEg6094aQLfd+izY0FSDSMdDLLhqC0ziSa0
	lRUmGMQ5YTDeuNViT
X-Google-Smtp-Source: AGHT+IHGSsVUmWj3Jah1vKvr6sQDWVSDBSGyOlSKcnIVvmpIKC/Y46McYZjwHULPKpThDtSFgrrx3Q==
X-Received: by 2002:a05:6000:1acb:b0:3a3:6434:5d34 with SMTP id ffacd0b85a97d-3a4ca413eafmr6970418f8f.17.1748247182279;
        Mon, 26 May 2025 01:13:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d8ea9520sm2349448f8f.70.2025.05.26.01.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:13:01 -0700 (PDT)
Message-ID: <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
Date: Mon, 26 May 2025 09:13:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> +void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val);

write_reg() / read_reg()

---
bod
