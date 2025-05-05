Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AEC1FCFFC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448599; cv=none; b=qPX7BcFgau0aMp2zO/6rr1mEDYy2+6gFwLAunS+QFsnc0dJKA+RKRDpSjveiirnZOewGTLiysOzfFd5nCUvDCBzSb1dB5OdvK5jfUMB+ryTuJQft6qQASPkX8JfU6eMhTVC+J2Zs12eKU2IFuiA5PmRxharSeoNlrX5GUQ8LHUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448599; c=relaxed/simple;
	bh=Gs5AWNbxx/SOdotQviDostKi6PkdLkHEc71kRIPSQf0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kRAIYewIIwNSEZW7C9eYsCgvqMX4eM89fNlNWMjbxwTDn3o6CZVGxTgFB3vMrrpngabKmjVitjxi8Dsmv3goWgEDKYBQhWiDNWjibRMsnpiflmLVAO2Qht+3OPPQf8F46GWmWI18Crz8y3Pfv1k63hbt/4KI1NzOot/B0tg5K0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=daLg+u3h; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="daLg+u3h"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf257158fso23413485e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448596; x=1747053396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpeTr6Unq+CiFUgnvKuAHal9BTXc1yrzMKrqPlgz8m8=;
        b=daLg+u3hpYVh5vQTrrxkxkdwibEqp7XLavErHGZLfEC0yxFG++AbZqW8pHf79cuyfN
         sS8+krzzLkQ7Qy2uqmEckKdlFYUMdDrqTpRPnQKHAwMCtA5SGk+lJuZoIp7s3HGspmKm
         yuSc8g5kf7deeypr8b5PV6X8/SiYyKjHr7UcfyRb4Jo54K8M9G87BD1miX9TtZPMJ3sA
         iJ7GVYgP3OICuLnbh5ZZ2AkpFSYmIHmDftb9m4ty9ZSBiKqSMaBeyV1475DiQzqKk0Mn
         XP6i2s4+lDXSUVUyg4N+ioihB5oeGUAUtIu/J1g/v9Hn8XksxGyXvIZ5BPcU7XFxQsCX
         ROCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448596; x=1747053396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpeTr6Unq+CiFUgnvKuAHal9BTXc1yrzMKrqPlgz8m8=;
        b=DtyO94QSTdmTU1JrTRjt0CXBca7Jac5be3xScsrPOfqnHwiYT4dJuTAwRFQP+HUv8f
         waU3i9kVPyVYau3Si2+yze1KlirklsvQyyK09Lr8hpmHdKwZYFilznZDQWQaKwYX+53G
         kmTthYNn+zPau1VrYsvDlcfL4hLgk428HhGBBrc6TCcdvx8VM3adNgPs7R6VlndOSzMp
         BorZiF6gbqBaKMMpm7p1zE4HFLGoYDo68SRmrh2GMi9gk1gRuKNuL3Xh6ZRpK08L+zjb
         j7WUfoPHj2mYNzM9deGoycSiIXu4OxXt0+agAgYZGvOj5ZSVTqqAgANiaMvFI5O0Bhsb
         D0uA==
X-Forwarded-Encrypted: i=1; AJvYcCXssAvkxwCZkfsdOKtuWpAO/T1mvRHrPRq6Qhkzv4o9logiKgB3lKnSEjw/VO5rhjjEfSHiDswaIMryHM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ4z1C3mhFu9rXwQR1lcf9s7XvlCN4vNQKMQrHtPNdoJ6ay2E0
	1VZs7HLzDH5Felo1azLc+PCBIfQM6euyze8PnA7TnjQblHCZ7a2uQ+6V6aJurL0=
X-Gm-Gg: ASbGncuJu6v4+XHYXFCTaGJHVgRjQ9V8NQ8i8sZNdO61/zhdJhzNJsDYeyqdl7zGyGF
	tT3CTQKXsM6hS6fqCSUqAzV3+Oosej7bkWR7xqQQ8C+9dG03KXR3BWRSX3zlzoX0fD7fxJoeOnm
	2tmCj2ATftUK0imfoVeZzbVQ9blay0lg1YZcVsRp1EkVa4z4nMisLda7ORgLmqQE5GrLlfyNojK
	Ahad5yoMDuUgGqqoVxCrAQYFlyhUboujjuKJAKxTZMBqcsVm4MpY7xPp2SurMIPaorerT4Bb74C
	ArDEVAMgj+aHhrdUZtq0MxnHiHbcsv4kJ6QJ2GtxburE8TiOe/Q2w77HKgZOtly3zT51p5SO
X-Google-Smtp-Source: AGHT+IGd4vciO1iWM2MZ33WYuc9Z6cveleoL1KHOCLqmcEBnu/hEnCR2SmyiZj6jI/P6HFxT77OnRw==
X-Received: by 2002:a05:600c:1ca4:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-441c48be0c5mr57583835e9.12.1746448596076;
        Mon, 05 May 2025 05:36:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286c4sm131072725e9.25.2025.05.05.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@libre.computer>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
References: <20250425203118.1444481-1-da@libre.computer>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
Message-Id: <174644859542.1377721.4181662111472881192.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Fri, 25 Apr 2025 16:31:18 -0400, Da Xue wrote:
> GXL I2C pins need internal pull-up enabled to operate if there
> is no external resistor. The pull-up is 60kohms per the datasheet.
> 
> We should set the bias when i2c pinmux is enabled.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: gxl: set i2c bias to pull-up
      https://git.kernel.org/amlogic/c/16d4daa00ee69a43a4c79000d40f9271c85f7879

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

