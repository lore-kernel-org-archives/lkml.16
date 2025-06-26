Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09EA24503B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750973537; cv=none; b=TTra+4fMDf6DFuaklRDMqvG5V5Q1d8aeCUoKJqhHPhN6Yb9bN+LI5LOWdOkwINelAj4Ypm5liMZmCPyFGQL6XzjXw4oiV9KlvZBXTJhVk1mZzU5XFer097YfT/5DsfbYYmxdZBwz1lY6zcLTmng++jaMTG+q3+ShLgkzF+KnrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750973537; c=relaxed/simple;
	bh=Vg+bsnBCAYgGaA8Ef8XIx7/sg+GRsIjqsHyzMhcM+Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMM3TycK/lAxLJCopZzLi+/QMbmujd7h2tWN1A0UvAy4khOstbm45K0r9ytFLxQSNlvW68ZvElgUmvyzX+KJ2hSD60AkOwiZzeg0bLpGemH5Z/UbZCory2q2OyEaPlwjigcUJbv5pdLq7o301r4HzJrk3NraOKL6qCrJhK+MhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p54jb+Sa; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p54jb+Sa"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2efb0b03e40so279600fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750973535; x=1751578335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xw6mnndRYOAvK0RCLzt9VBUYGf36cfO8dHKbt/kftME=;
        b=p54jb+Sa7NiFZa/s1HGZnff7XTyBQKiDmjMHCzO3gh8H/Rd5bNZEh3f9CicALQlY0B
         lbyD/tdJEUAluZy4kGozLVMPrj8LnjMw0Vqa+/nr33JAsiYjZTWpCnTLd+TFIpcSo3pZ
         w4z0YHGpH++6nJPVH98Tdwo7mTQWz4KgPNTi01FcpSNFSWA81Ifblr/PNUn6RHttOpIK
         rCNyVfrXzYZpZKsgFHF6NWT5nJivX9zysULfcA2JNPhl4hHJwOGsiZuhb90XTw2SPN2i
         9LtwMveyecb0+/HBmB5ilMdgCfuR52jI8iguNLxlwdQOtnaRZZOYnQRLYIBOl4t9Zzs6
         Kc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973535; x=1751578335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw6mnndRYOAvK0RCLzt9VBUYGf36cfO8dHKbt/kftME=;
        b=cpgM/DhdpyiBH9ln7vZC7x7Shhz8XJhh2d5WCUR9pyGSUsjwfp0Jelrk2CdpzvbM2R
         ehQtQP0AcA8chOrrW3EPbNR39+g2gxtM8PeAYElm25arSYUFGtUWaW4//YohWr/gwQrn
         HouMrjQZyGXE3J5fh0tStWkZjj8qgLQG0Xqx3UOvY+elcKBoIoEUt/eQaIS5I16BxmsN
         6gPS2NikUrd25M/vEoTp4Jr6a+9uchFW9xSDWpGHEGG68qaWsxx13g2WelWgbi3WhlZ0
         5R8HrzYn1peUmecLd4DxigaSd5sx13PkYd+vRv5/H+5k1pGvPp4n21pP3TPz1pUK5N7i
         /kOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU70qbknPo3iTJpjZ3+G5mRNZEHX2P/bzCrl/hZJFBjkQA3vqIO61dmXxXn28oDLHiBpO30+GTwX/JycV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdYfE/1joyXo5dQTWol5uLpN46pN0wvvsaKTCdq7G0ZDwih9aX
	++ZWTozpgT2iA4J+eLivJ31qePLAqpOZLWnlJwZHo5VhsZfMoX02a23TIgSLvAdY6j0=
X-Gm-Gg: ASbGncuXKAhD5nlHCbOCV8M/8ZDTkoLPKhkc7boaNnTTaYOMmsyxUC4sxkCMWierS7n
	sTQF+ByHaDIk4o1o15fipsKG0IqOOz32lL8KaEhixSptgUkb1prhB1w93TqWdgQO0c/O8enozmm
	TUPo2UTK50irvMtCLVb7cJgJJA1X+Qk6NNqESUoGNuOwwuD2FwwOwe3YC/coNCcWCIFBNbzhpZ4
	ztMDoExd7zKwxSdHBg6cRE0HmFdCODrVNc9K4SJBmNS2j4IwRDibilirbj/fhFZJ1GXwZ2NV3b5
	SiU+hd1ztwOHwFQMFdV8zK3O+AIXeUB18ctXjYBvVOL0RYVMlvSfs2UeIH6RAv7N9KX4
X-Google-Smtp-Source: AGHT+IH2nzUMv//M5Dg3a808pERB9UcVAPf9zLq+udw6Z4J+VVriEvR2PRmVpGe3ReP9rQZlc72UBg==
X-Received: by 2002:a05:6870:b488:b0:2ea:1e5d:8ad3 with SMTP id 586e51a60fabf-2efed6782cbmr417990fac.22.1750973534993;
        Thu, 26 Jun 2025 14:32:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd512f0cdsm547789fac.46.2025.06.26.14.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:32:14 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:32:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain>
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>

Resend this patch with the changes Andy asked for and I'll Ack it.

The other things we discussed can be done separately.  It's also fine
to never do them.  I'm not your boss.  ;)

regards,
dan carpenter

