Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B716F0FE;
	Sat, 21 Jun 2025 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512191; cv=none; b=bFG6fmTSGaCagbaNE/CcoqoJy5pJQD2xFA8c8c9liC35a402HRgmr3HUSHd880+FqbtTAOKVM+Ot9T2VkFo8Q2Ywt+TlDGtLBhR70V5c80R3ts32IV4t2+36qzz1+fIWZvx2ObKeaQaT4sKBTd7geTmt/s7XEk76b+HCg8T7Mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512191; c=relaxed/simple;
	bh=9/kDo39FB0aHZUKLe2CdAfbU2bgRJXBgchFq5Yb0SGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAnB47ek4lw1rWSDsF59cseXitTLiHNyc9SLQZcvG7Q6ENIaAtB5u8CyTimAIs3jXHuUgmh1f+2RQ7Ef8zG1NmvMv68n4ViWjHzRekXYQPWuXohc9+qpHx1EfiX/9L6/qODEG0zToXEMrUGP4RiU4ZspsC+YXYKhfwGifkc/J44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3Ijb//P; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3Ijb//P"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2360ff7ac1bso18823765ad.3;
        Sat, 21 Jun 2025 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750512189; x=1751116989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/kDo39FB0aHZUKLe2CdAfbU2bgRJXBgchFq5Yb0SGI=;
        b=R3Ijb//P1aX9to2IqHrVO9RF2ah/CnOXT9jrnr6t25FrcvISy+LCFHfdpJxtDX1rn4
         I+YfOs4DHoVWhQhq0FS1tMnFrrFaRYpwjRuO0fWu6tgDP4OAhjS020zgUy8QW9WllxBi
         SMRji1NQKbSk3yqMhHE/s8h/id959LGCmEA/pS4Tx8y1eqGTdqZWfsFR2PVeai4oUOLg
         Qx50RbnjQJJOWdD0OdFFwVGPtrc/8VrOhRasdSyPekgYI/tFCI53Cl2aXFP3qBrweV8g
         6qWSi2cytd7/Z7SX8VjE9LSPoGqYMUc1J9pYQpneZqF4F2LDtBcC0z+9lQTyuelJlbVN
         e0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750512189; x=1751116989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/kDo39FB0aHZUKLe2CdAfbU2bgRJXBgchFq5Yb0SGI=;
        b=iQBXEpYYGArmoGS/iopczf/I+1kD0WS+UOgkh9dy5ylQQABl4fI/yLitjwMOFg1vOM
         sFPPSsHm8Fr4Ybaglg4/XOwl7NhpHZNzOb4Ngo//AGqRxl52T3PbftKsjnYgQnY1fAtq
         RnWnSwEeF/DOGAPdW0ubGIbGOG/A6tE1Ha7LhbEU0CDEonhnCbE+7OdrdTnNqHAjoiY+
         d3M7lMX3R3MyQcomVNAYBMAzdhrpo0+TFdwDAtdqBhYTXxthQL0IilwHay9XpCKM1kOS
         t3AxNEg0P/6TLkdPKTc/jy1dUo0zhb0enVOJdetjJYJYMeB03U7eSGEYTwEYxIlxe1Xd
         R6iw==
X-Forwarded-Encrypted: i=1; AJvYcCUhduodxaNC9t7YLnivHeF5zXvxHEgsCkTbNRi/7UB6dibWP2oXoqSvhvsKfaFk94MnbTh8vcSbjuxmEO8=@vger.kernel.org, AJvYcCWgpcWiNbXzjlZ0CP7Acc2CbpSL+FXBkChE83Si5obTrw5oel0bCa0hecJEwyFjmOHUTYheSFGpmxfM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2N6lj4pE7Bgs43mO4Rfm+IUllcUXqIXAzpUXtup4P8h/Aip1L
	gBQCzx0ztddbA8QFAlZquOMI4sgKoegyoq9u+yfbdas9TJrDCvB8XpoN
X-Gm-Gg: ASbGncsrXCLpm5tf9flaxBNLNq45/5diogLpJKlSS6d1J4WUkQp4Oh/3lbxzjgCKJua
	aCspGZlReQg45/JNFCxNkj9Us++iRxJyc3aIeMrAhfEbdpCXm87EtknJOau3z4P1fVzPnzS6ROP
	X4el3sKqVbZBEGzem2IrsUybbpI9zd4WHzjAG6PIiVtmU+FoJ3VGlV2V6gH13UihHtqNI9Vxpg7
	K9glScUALHLzQeRBsgmA/cH/S26jtyEkqD1BqpJu3zBMFK4P60ISM6to/fqTNAT4tmONhr3VzM9
	PqegxIYJM8+fj8o3Li4YvZnjlcqy9KTt+7bqeCShD7Un4Z3KwXjiuwjULOwmuqj3VxowCG7OiXJ
	LlnLPAd3deMnNXu90VaqRDQjvq0vdFYeiBGkrabigP/DApJTR8tA+84o=
X-Google-Smtp-Source: AGHT+IH6a8rgZCZ7mDc5Htk5zycsKfVJ3ZPKASDb7eu82shEau8bQ023Uc10bFTZ8TyT9YbjG+8lOg==
X-Received: by 2002:a17:903:4b27:b0:223:653e:eb09 with SMTP id d9443c01a7336-237d97c7f5dmr93509315ad.7.1750512189002;
        Sat, 21 Jun 2025 06:23:09 -0700 (PDT)
Received: from localhost.localdomain (123-194-189-72.dynamic.kbronet.com.tw. [123.194.189.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d101esm41473435ad.64.2025.06.21.06.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 06:23:08 -0700 (PDT)
From: Jay Chen <shawn2000100@gmail.com>
To: shawn2000100@gmail.com
Cc: gregkh@linuxfoundation.org,
	jay.chen@siemens.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [PATCH v5] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
Date: Sat, 21 Jun 2025 21:21:53 +0800
Message-ID: <20250621132205.4617-1-shawn2000100@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250521114047.18001-1-shawn2000100@gmail.com>
References: <20250521114047.18001-1-shawn2000100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi Greg, maintainers,

friendly bump — anyone any thoughts?

Thx.
