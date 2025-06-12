Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5874F1DFE20
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749709374; cv=none; b=tQzRkPllfUGd43bORPZ+TJDu2PTSoQgg+ArjWMu5+U2qPU9Ma0u+33TLCZYaMyTclbkArMmiUVKEXhlE2GUsjoIVPVxavT/T9fpK6xxSILfPWjeq4zAsDXE1NPES8rqqNtApBN2Oo74wLj9hbsJ2ZOOelyn5+FQNOesRt7SNSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749709374; c=relaxed/simple;
	bh=NVSA+aFvs1XO3TlVQr3XMhBpHu6vTAXKDoH9mbxB4wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMXC9PVDOJx9g6Q9NctOP9CBzR4qnt0sBga0FW3Mu7i6tcICAqGBq37HB3E2TL61Ue9Alrk5g9+GzE+kUsCVBwLhWf1eS4FGo9hhkSgJdJv/OBtnxPZrGm5Ume/DNH/FMijxLwpasmyf96iIpeKyIc3oOsQ67Jc9iqydcaKy8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=oGxaZFuG; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="oGxaZFuG"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a58ba6c945so11905941cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749709371; x=1750314171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NVSA+aFvs1XO3TlVQr3XMhBpHu6vTAXKDoH9mbxB4wc=;
        b=oGxaZFuGzg2ustNbGNKVleQsTCAYnk7VpaJ0pBE0Gu8xGCkdCeklfkUPIOh2gENeiw
         x2L8jpg4makVjVhiLxNf7ijMxO2AdHtxQR/B9h40D+xj6j2lq0MaHkz2MPJTT2JsnnVP
         mPVl1APKyY2GvXrRK2KTlcBFkougfQYVw1Z7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749709371; x=1750314171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVSA+aFvs1XO3TlVQr3XMhBpHu6vTAXKDoH9mbxB4wc=;
        b=E2PvrxCPXdRj+YK+A8Or/HQG2bc4UImdzPAX/KyFm8kY9NRm477PY0qC25sKLrU0R2
         cTxGK0t1t24/euD91PtS5CzvSTqpRWzVK4cRNYxPW4DSY8Zf4b4DGro6lwSrAYZwWok9
         4NMgbtg2cz0Rsw3CnNB1USCWzwYihAfZwtNILFccvUFnFewWmOJ7bNFXKbKNCZ4odDGv
         x8ppoFGI19o2WY0J3iX7UBR6lbXqg72xTBT2p0gIwo4r4PabHshsEJ6HXrlzkQpsubp6
         Y1k001mIKynwhNpzM6HLBULsWVDGlaiNf8bgIFpLRXd+00ki6qCBP+ytLhIZ3cpNK5CP
         dKNw==
X-Forwarded-Encrypted: i=1; AJvYcCUR+yhDqrZUZgoVA2c4xVvGOSP2PstlZrsAmSAZEonUS1kezmEktUnAtFhFCq7Ru67OvBp5lII/VWkwZoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIU/p5txv4M6NjcVzAeOEymxSstTTfb/16Z7Z41ezvRW/DeNP4
	r3v3Kxiax+8F7r4n2ezarlIIppcEVm3//7tAS+Kx+8AtWmlorG36W+aJqHWDixLRxqlrUk9Ur+3
	dbd+18pKOHuqe9l4RhrDtNL/a+mpCSiVWivB9GxTQUQ==
X-Gm-Gg: ASbGncuvqp1vRytvXu2HSc7qJWZ3YVav82yllIQ64GDxlvVk113L3f41cNGlyElMxB+
	GzfLQPg/fn5U11CAM0ka16/IAIi7TTu+7gt9iDOjE/ctIy6+uRE8BJHjpTnS7AG52oHVcrZx2hq
	9B/7p6Ya42f3etVqmBzhAFLE5g+jj43pM8RtBzHqsYDADh
X-Google-Smtp-Source: AGHT+IH2I+YwhsNEN2W/f0jBkF1nxvsiE/H4QK8q+uPATGIvdhpGf8PYgM3jx5R7mR9gdQG0BY/Jl8TKR1yRM88Z5FA=
X-Received: by 2002:a05:622a:1e10:b0:494:5805:c2b9 with SMTP id
 d75a77b69052e-4a72298b30fmr46608091cf.31.1749709371314; Wed, 11 Jun 2025
 23:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610021124.2800951-2-chenlinxuan@uniontech.com>
In-Reply-To: <20250610021124.2800951-2-chenlinxuan@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 12 Jun 2025 08:22:38 +0200
X-Gm-Features: AX0GCFtg9rZdO_j-xlB7BjFTfd7v-suiRWlCa3w6oicMUUxJvtRI76Y9_mraJcE
Message-ID: <CAJfpegtF0KUw86m_NHFGUtnfcmPgzO88hv3AOs14=j_OQYuvbQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] doc: fuse: Add max_background and congestion_threshold
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Jonathan Corbet <corbet@lwn.net>, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 04:11, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
>
> As I preparing patches adding selftests for fusectl,
> I notice that documentation of max_background and congestion_threshold
> is missing.
>
> This patch add some descriptions about these two files.
>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>

Applied, thanks.

Miklos
