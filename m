Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1ED22489A;
	Thu, 24 Apr 2025 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495703; cv=none; b=NsE8jrr89utnVeuKbxnu0OGcp5G+sQ0/0g8y7G3x4Sc9ZszWMIPOIeaiVn61aB2Yo37mtucxko+WOJ4+lDuO2RM04qwNkZwcTQPEghXB90Rjcsjs+a4A9nq7PFn3FpwYhdW/TmiAmdpnkX0Pe4iSorHq0Nm8fo8Dx+s2jR1Lueo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495703; c=relaxed/simple;
	bh=3CXnS8upeLfS+v4WADg2CmZoMTXWci6Kc40+q19Trco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYCK3RzQzha48207mLFDX+uwvMEiTGI444/vXQPP2uFqAwW05T+swB2Oo7eD8ESN4YGScJx2KxTPMcRl8LUrvYuNrkdqWho8ABCRgzKt627He0ELQ6ZOHJAHoa+99MMVlXuy1Yn0ECWPdM1QZOkubraFRzJr5M0IvfzORsLKNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ4bLeGG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ4bLeGG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-309d2e8c20cso1178140a91.0;
        Thu, 24 Apr 2025 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745495701; x=1746100501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaXXZf7VNdBf/2Zq+DhTKSGQQp1DT6ynEcUt9SkvZ48=;
        b=SQ4bLeGG46eh+UDi8wrpzj/5B//n+XOia4athsEE1cmkJxB1a9gtqPj/ObRt9Ei//P
         Soh+M5hRrp+gQhcPKCK6yFaCCVl9YHI6nhYAoYnjnaQKXrf1gV51lQJ7W/US1sIdIkbk
         NcQRnjQDUhrIuZdHzR3/5LiRic2nVUKahqj4GtzOQEj/4I72xJY92ej+rbWtYlo36G/I
         zE12MTKBHW2dR1x3NCgJfyoL9LuliAez8Trt//SbPOE/DK0iz9PajmeI3+2qUPbMgjiN
         f0ZGzUmpnbKbl6RTmfo+K8d7RM1Juikw+KMXwkPiNUcz7qlBdh1GCfoUNYx7xeSAI4O5
         LHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495701; x=1746100501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaXXZf7VNdBf/2Zq+DhTKSGQQp1DT6ynEcUt9SkvZ48=;
        b=Z0iciVFAlfyZdvZUrjBilUJuIGFPVdj/g9ZfT0Z+jRCaGNUS84GrVrhVqcWVBzsKzR
         fReeIZXSE2RH6rkCZCQutF0BqGf113L1Ir9JUavb999Bvd6FVzXLTuK+XI5MHhdoMmot
         8Aal7wDR/hReBhHQ9D1Gtabtqd4HdULzAN/2AJFO7+TFqR1wWxqpQ63uu0VqkEosY/HU
         o/H0DIkxKuecFO1CHy1V3d9rP1I21areb0AQ3WCt3DF1LB8gTe9K32/upMnkai+3Kf3u
         04M6HErkJhkhQACKpzKDpKrrPyBzHSHcB+d4oELr5OQhSOgtqf077Ql7r7kPeMO+59me
         5pHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoNelk7vyKl6mW1cA5+OpskLcrYw10MGChyIUUxwG6s1q6QvAty2t0SUztzu5prAh1XejFDhP/QwudxdZv@vger.kernel.org, AJvYcCUztRXNHog1QcehFGa5t9BzI/DWrLecA/ocr7RYpe9VhnpBihcEFwdXzJWVJKEJidAZAW9cJlJ7zjRb@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxauGc7eapIT2FqrjEoMitS5YZgEZmZffe1iryoOmmiWykLlY
	qpbkZU2LunSvA4hliqXMiBFOnf6DsP4k1+Fb65FDA4UYNpJ3BSdvkz0iVOWmgDUhOqpmYU8KiGg
	b+pPTznzAkzFq85Erabq0C4yr4PE=
X-Gm-Gg: ASbGncue9JWDnhgWUuWZeccFWiSdKzQI8xq/6KO+N7Eikpke9p6VVS+EMUFCSZTNWhV
	Yhu5QgokUhnkUimcCWpigYNd5HNNR7Gh+PQAEQ52h12fQ4akwoM2goQB2ycJJ6iOoHj/9Xp5lv6
	lLk1cxXvTom67F5gYvtA==
X-Google-Smtp-Source: AGHT+IEVr8RYTjT9I12iRuzsSclckx06FCkr+9NaSoiRz8ff4GmsoCxyYCjNxZ7KvxRfcH7PrtxX3ivBVdZoECzD15Q=
X-Received: by 2002:a17:90b:2d47:b0:2fe:a614:5cf7 with SMTP id
 98e67ed59e1d1-309ed24bbf4mr3357527a91.3.1745495701229; Thu, 24 Apr 2025
 04:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org> <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 24 Apr 2025 14:56:50 +0300
X-Gm-Features: ATxdqUG07gfeFyk0H8HmHqP2CBe9nsNXfIbkETttN_SCGPWAGkzvs9MFfBgSr_g
Message-ID: <CAEnQRZBQaYhPU+hzCLxKGQ+UmVpp6MEXDCU4QWVh+Od2mQ+z0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: nxp: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:54=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
>
>   imx7d-remarkable2.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '=
^wifi(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
