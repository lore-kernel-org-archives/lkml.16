Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5061922F4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745056441; cv=none; b=bnVe9sfJubYOi51ozFwYR5vybeJCCwgynWEcc6e88XNj2kLbSgKFmY/gWRS9Kg6YiHm+6d6qjAsAe9kwFuwy4vZZjT5xIBdIFnGB4s2Wzp0Wy7oVazOh0lL4/mL+pqefGoEkgAvEYLqYoqvbr7PMDYnO0IL90OLERQ3v80iHVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745056441; c=relaxed/simple;
	bh=ILbRT/qRg9I8w+76+daOLvD2JyO9K0fujjCnP2kSBRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/jipLabbux73+S2+66pCQxA6IKikMx8N4DtKkgIwq1a6YCSlGL0J6t4DRpWS7FwlPhER5qxXFFV7kgC6uwu/BDOkVIV93tNVLZdpXZF5NL00BgTqrQ8+ESTPL3n0k/tytdzKfF2kmBQAPv8v8vabD9SpzWrmCr7mqCjg4mHY2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbH3kEGF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbH3kEGF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so3452555a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745056440; x=1745661240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9yKVzIA+FhMTC4rrM4hDlH+jkyt/OHi/VKWuwVsMN8=;
        b=tbH3kEGFBukkIE3DK6NLzjyBiKq27mDo/fNqIZ33TQPrgHhbfk+BX7YUdYQ+3gOJmy
         /22UY+j+OGrnJoO7awla7VaMvuOw8vM7l8l7ty5StU9h0hGdv05Mk92+BAADaZt/UEsw
         YYv8XWHO33pHS05V2g8gBrfeoBbOPScWk+zalFi2DujPN34wHvH0COZyuFCmpxs0oTVf
         J4RnpK4TxlWXCQL7s5yxGucLDDGcPLgzEylaxw5MMLy/lNjj9R1gCQjHciQcJVfljXv0
         qLuASlUBGq6rooxjL/xX60EC9CnaY3hbuRlsOK1HZZPQbQMi3bTykrmdkYCGVlol/ea/
         MYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745056440; x=1745661240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9yKVzIA+FhMTC4rrM4hDlH+jkyt/OHi/VKWuwVsMN8=;
        b=NoE3/6I4bNBypTufdVpXexk8+Frp1kgfb119FfF9TN9I+0G3LkNMeY00j1a9IZjgu0
         wQAmfIyJaNYhUQZiJAFt0pIgwPa+vadwvtdJATmOHCh6Fn+QdYX3qZ5UhTuV41a2sHru
         c21Aizy5ioLZPeKzfPt6cxdC9Tw+HqD2+ppNSS3FEeMx97kKnoHqVfgRTW4r8odDdL9F
         2BOo6IfcEFIyMhWF6zTm/RC4GLr0mib5uxLKQbE1uK3/vbLuhL+kW0KVVcUA7mtDboB4
         8R9lG14wI1UqeIHy49RNw3kSklVNLH7095TyiY2uWxz09sanhhAm54DZHQtszxMJhGSH
         Y57Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2Zx+bOv/yJ9AG90pQ2ABL0BGAxbWwzM1BZc3Jna4OujwM/o5t4+vYY6s2j9PmdIjcuFmU5wTG3NymINs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2TiaQKnV7qHVVRcl+OhaXoU659KVL8CNMRV6vO4Ej1gk5jb6l
	Glq8+IJ13ZMuk7p2ZmzS2YaNwJeKMm6rB95T8n/VG8NsPSVkxM0CdBneRj5b0w==
X-Gm-Gg: ASbGnct0I1GAbYvyl8HxoLSI6f5Zl0OQs01BNWfYPy+0mqa5BC4yKdlm/RN3bDhKDs0
	HN0VtyOxjm9GWfX2Ro8fs4H2iAwhv9V91cPlyoVQBJKxxUJVZlW35SfElRdpNvRVZwV1sO9f9V6
	LgZvGhbgmMrPMhg+j+Dy8QktB6jg9G5UWUMcTChwxHge9enGk+RVvhHPqtT86Ygzhl8RziWzID1
	Gg5dkO3rs8uwrSbG7vUJbdzN2AajNTrfFG7kGNxABJSI5AwMEDaQUehecalJPKGIeRb6AXJa6vp
	tlHMgnc2eqpLHkYPyCl0ayGbxzSU2d4si1CsAThJKvcuQFsoYPQDuA==
X-Google-Smtp-Source: AGHT+IE/nEJy748pRZBsgQs1pUuc+KJsoas+6d1SDGbI9MhgwRJ1z7aHS2ich2UbQnlsP6+skuAA/w==
X-Received: by 2002:a17:90b:524d:b0:2f1:2e10:8160 with SMTP id 98e67ed59e1d1-3087c36108emr8133093a91.11.1745056439818;
        Sat, 19 Apr 2025 02:53:59 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e05db51sm2695542a91.43.2025.04.19.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 02:53:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: heiko@sntech.de,
	Kever Yang <kever.yang@rock-chips.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
Date: Sat, 19 Apr 2025 15:23:48 +0530
Message-ID: <174505638863.29894.12853512494056448618.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415051855.59740-2-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com> <20250415051855.59740-2-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Apr 2025 13:18:49 +0800, Kever Yang wrote:
> rk3562 is using the same dwc controller as rk3576.
> 
> 

Applied to pci/dt-bindings, thanks!

[1/7] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
      commit: 1d6d956497ded6ae02faff74ac493adefddc2c73

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
