Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDA21578D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432811; cv=none; b=bcEbRS1y8suC9Qja7lRhfGew3F4rTasLVEoEsFrFPyG+nWKD7jv2C0Ts1g0hN5sLZSAoP2DAM9Uu/BzEDe/42zYZSkjeUlTuKwQ4hZyN0eZJIaCUYDJBLSlDHnXWpOE3HF4nVvk7QtL5BJLd7jS+UgLL6glg84GjjYfjWtY84YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432811; c=relaxed/simple;
	bh=PDjgS5kxYJNN4P6hi3kNrFVLAcSYLUEUsuoFPTsbskk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=OgQJ7pVn4KTQpD0OHJ3O+brc55HyNzqX1wx8QB4GkEfzpqaeUgVUAATVYN77TF1WsONKSL/N/zjPLE2iDm/0XVdJ8oPhDlAr9I2UjasjWWoSivW5uah5ccg7hD9WlnzTf+OoPu9SL8PFvbra8mftTWHNx90i5P7rqDgVgHNCLeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tlvince.com; spf=pass smtp.mailfrom=tlvince.com; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tlvince.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tlvince.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a363d15c64so3053820f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748432808; x=1749037608;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PDjgS5kxYJNN4P6hi3kNrFVLAcSYLUEUsuoFPTsbskk=;
        b=UZCA5l4Qo0dklL2oj18mmN8znYCukLClJI2b67XfqfchpY7oHxGnS41HuTLpcm43Fr
         o3gdPTFaSCLRSd9Ife9FHNIY4TpV7L++s5GP0H/67FT1DopaK9dpHYo97v2fjrWVisTP
         2QHNIAM0YFjjx6usS+AL2VbOpRjCfldjc1Lf0lMyKAIMFS6i53WTBZMAgj1+tAz68cl2
         NiTtbJ6U975L3Edy93tBJkPGiXlcW5fnHbolsjbed2qalRtx/n3aH3HCaBLGvGnlS4tl
         GzJFOlacy1ZRUp+YxxACBcBwxc8LDLM1yz5l7KTkKNW9h03ngxPhzzpV0qh7+hMQQKtH
         nHDw==
X-Forwarded-Encrypted: i=1; AJvYcCV9HNbximBV8xKtc0tHJAQ9FYUKiAvQBkUH287Asv0LHFbANQV3wAUJPS6fLr6XBKBuuE5q0OyC7x4Gr7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04HsuWiqYzkFyAYgBvD+h6kk6eKTA230v1VMAnz+ThTIekhXc
	1mvQaJJPOcjEombLEp39itcExPGap7+AeuVBtlWqFpazQFF8xvQtjC1AozVAghsAblLLJubvTsG
	uvksikNo=
X-Gm-Gg: ASbGncuTptneJqapa2QwFaJHqnJX5etbfIndOHvSnHMYTLgrwQkkLCGuJjCGpzHDT4r
	UuzJlRi2Fc2Wg++1SLcp4mx5FVBXMlJfWzH8U9Ig9XHQe40FpxY5edJy5pl72R21Rupvt7CLOmE
	MOgN8xrJbmKDrQdKwdxN1EiwOfkhh3l+mAGVLFsPXLsbNoUS/g8t3N3mZO4Ia/gwpVIhqa2tPsV
	iDiyzVBU2iNZCw2pEs8jB85jP4wC3LMecQLTRk+WSCDu5EZdtM5j/70qkvhAxUfxoD5bUMqEd6p
	f03GNqFVHkX/viFnSN8xCr1ICR+DGlOvtjWs+2jcZrsDZvzN7Hgh7m+bLvIVy0QSNxBFCtqx79R
	3k1jV+xO9E+mzDELN/yNizNEYRO+f2utzSUgLhENB
X-Google-Smtp-Source: AGHT+IFNOKh+Aesaq3PzVr1eR8i8unVWVFffnvHc9V8h7XsbOFLDWZoiM6TIwWG3GEwz2XEKjOlv+g==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a4e9437a5emr2061450f8f.1.1748432807768;
        Wed, 28 May 2025 04:46:47 -0700 (PDT)
Received: from framework.filo.uk (lewi-26-b2-v4wan-163478-cust494.vm4.cable.virginm.net. [86.21.73.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac6e360sm1244603f8f.9.2025.05.28.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:46:47 -0700 (PDT)
Message-ID: <751abc6bdfda6bd3b99aacf2362bb4c590258f95.camel@tlvince.com>
Subject: Re: [PATCH] mfd: cros_ec: Separate charge-control probing from
 USB-PD
From: Tom Vincent <linux@tlvince.com>
To: linux@weissschuh.net
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
 groeck@chromium.org, 	lee@kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 May 2025 12:46:46 +0100
In-Reply-To: <20250521-cros-ec-mfd-chctl-probe-v1-1-6ebfe3a6efa7@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Thomas,

Applied this on top of v6.14.7 with a Framework AI 340, BIOS 3.03 and
cros_charge_control and the knobs now work as expected.

Tested-by: Tom Vincent <linux@tlvince.com>

Thanks,
Tom
