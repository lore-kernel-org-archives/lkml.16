Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F61BE49
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 00:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802233; cv=none; b=KbkehdtCaTgqcgq/qKA6Il9q9K27/4Q/0qKPsuNQvk8DtNB9S6g10SNOz/8GcGUsVzNrOvPVBiLNbtjRKdSdMaTu51UlMhbCTv3c+s8qDkir4o65naBa/sp3NfgNFGgswaAf22NNsUyaJ8Ivfr/ZGtxh7isFjj4M2Y/N1AuhNGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802233; c=relaxed/simple;
	bh=anb12FOBAqGcVLb5Az51960fmoes6Cw4isJ5CZ6Joqc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=inibuexNyUKIyehHVtTJCPVxxi0SW1th6W+evnzPEAH7jZGyX6RCm9xIbvxOVWyAsWUiqJ3VdYHQof+LAIGGeM8Vk16wvq5mqGRRiJ9HDRK7EU8HILn+BIHQPx6DH4SIRxSTOfXiFjGCLfhaXTkfzeHQ4PvIF30ILW5XjIjqCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Tgsh/zjS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Tgsh/zjS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163dc5155fso7551525ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 16:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802231; x=1739407031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9izPoeemfLEYBaxGdMdJG4p8441bu8sme8NZDVtqdAU=;
        b=Tgsh/zjSVKsAd8c9x55OQh4nnAmFSSDzifYsm7kWuPXpiR67EJbgfEiyqE5AZYRgru
         xBu2PASjD2b43tZmKgRsMBaHmZzVkVx6HSadVc4h8LJmhZIhksMhDev7VlmudrRwz4Y+
         cUxAv95WBsC+slBzNkHRkAS7JkZUxf1CHVvZaXxNg9eksm5aZWlFjlhVtnrlLKGNjM2d
         3UsPSr2lBW5g5LqiULrT6fqfDmtiQGDLOqqKxvZiZtP3ACwIHgldeghxPux14k7SqynY
         80/f0oDx+6qTnDgQ3iXimg4HuKE7h5EBv9ZAv7AaGbqa9T8uAJCREBXuJCb3/UL3jhka
         On9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802231; x=1739407031;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9izPoeemfLEYBaxGdMdJG4p8441bu8sme8NZDVtqdAU=;
        b=g5RXGpdkUfG2V2qyy8VDWu3s/ADPX5jv4RNpbV65QCQaqDIW5pilpU5AZz1Ua+meJR
         qHr/aamUbLRRk42SkvQbk4tg08JPXQFKPdbaKYw7WYYmAfSQ+FAPLzL1OD27EbAPsDCV
         L45RcbRirq0DOiMhdurNClNsrJmY7KjR5b+xW7x810IQX146/2M31wIbWkj2Z1d5Lttr
         baCAtoQhLP9qPfgDvy/VP/0hg9//yIxEmWEQRiuNqSrBVMVh0qS36Zyyq78MjgjGJ4o/
         M3InsIinJBy2MFXi6nG01Ai7USRMC+gqh2HREd30I680enycl8b7aW7zQu2xenzCYutU
         +XJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWno8gpQ8T6JFq06vwSYMM4FuhDbnaSpIy27W6yl83SU9yVVlQGgH9grti+N0yUal+TnpQzMCmhJJqAwcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YymMn1eDPF9d0MltKjczknhMjZLmNkrsmWn9n3rRa44QLbW2s2W
	Yc2FEzYcixzVK8pGnGbcSTHlAPrUxgMVLZsXAIZKnBk8eyvXddLsx/CgRy10hFpLvSkXblLb+Lb
	6
X-Gm-Gg: ASbGncsiEcKJhwAcI1djbrhqWZmJB7CZ06jkDIdfimG1lW4LFs+pirhdxAGqABqOFY3
	8G+WUu8ABvYgm68ycIkdSN+hjIsXbLwTlI0D7aixJfJ6h2sRh36kjHwVg4pj9mFtheeYu6B261h
	278XgBuvWtBM634spVp8G4QwPyW4CGaWgFxLLGYPL6y0ceO9FSTal5XaH46FrjHKGW6CTh4ydJq
	D7CE9ge8SbCwLyY+/mU+sCwLPkQZzExg38f5niRCb9uPWamDqdY1sbVAN7wZsiIsZLcwOMGhWDh
	Umx6E3H970HXew==
X-Google-Smtp-Source: AGHT+IGSn53uXUdVxoPImTMW1Zc25hP9pmoBhFU5FbDj28SoJOJPEc2Twhblt5clw7+Lqm5iorPULg==
X-Received: by 2002:a17:902:e74e:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21f17ebbb5cmr82697035ad.36.1738802230802;
        Wed, 05 Feb 2025 16:37:10 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683da71sm50165ad.115.2025.02.05.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115211648.194016-1-krzysztof.kozlowski@linaro.org>
References: <20250115211648.194016-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: ti: omap: Align GPIO hog name with bindings
Message-Id: <173880222984.2488567.7281427251846547425.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:09 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Wed, 15 Jan 2025 22:16:48 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
> 
>   omap3-evm.dtb: en_on_board_gpio_61: $nodename:0: 'en_on_board_gpio_61' does not match '^.+-hog(-[0-9]+)?$'
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti: omap: Align GPIO hog name with bindings
      commit: 10a71ea103249d3aa800552595a90ad55932c781

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

