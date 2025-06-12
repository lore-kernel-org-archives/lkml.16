Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B7299A90
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742044; cv=none; b=B5f5srmefnf7yAf08hgroP9ju9O2FsGpltMOzmAIU9Ho8AL6VcnaRLs+VDTSwzKKQAHThBAzBH/DKnXZ8bvVS1TBxxGDy7WuOFi7by++lb92ie05YG9mNLpam3UAU1nc9x4I7xUVpnQNqJHgORewpDHfzMh6bZHdD1KohINRTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742044; c=relaxed/simple;
	bh=P5a+/vRfejKC43Dn9JI5fxo6bMhv1S+e3Kc5pPSYgbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S71h9+YOp+9HO9MfE9bCtH7RifNWv1WkMSuzvGleXu7xJAhZeIH2QhLeqaxfE8K+Rc43zMsAeDuRp6KraEj35Vbs4EtYSLrmS941qe5gPDLU2yu7YRWt5jOjuPkmlPHJWAfwiOziYKZSp9MBCc9gBUDSKxjkd3DhoYylKHKB39M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Mcrad/iC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mcrad/iC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad8826c05f2so207112566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749742039; x=1750346839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4Pqtv5A7DN8Mx6FTwFxLJlKUKCl+g5TgC+f5BBxIp8=;
        b=Mcrad/iC5DpNyd+l9O9r/wxZjSFTF4Rl8WPRRjd8ouJuHJuc1p7yGzFdmRwd6Hy0TL
         nbleahHRpubY+ng1tOC2/Obf9gfGtnmDlL2elZAyOOXM68ypQnc3LwB15IhAtjvfXHYr
         Fkl1XEsWe7aZTz2iKE5PQG9CqXoKqTeVrWhr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742039; x=1750346839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4Pqtv5A7DN8Mx6FTwFxLJlKUKCl+g5TgC+f5BBxIp8=;
        b=ZP2YHJs2vsDPiDCE2fVdzdI2eA5MpTMl+0qMP+c+LnTM5OqkhIRMLkTtSPPZfj3ql7
         ydXBYK0Q7a0179r+TOJ93GA3/8xcIzlPWmidC7W/EmemOockjbOZpipJ1S0mgc4NKtY7
         4CWxoLNPlTe39pEPhz29fyEdewrvst39NVVHR32k2qs6OnQIoDILgQsWylAQjndzANqb
         FDi+3vG4T2VVZjlqW/8ArgOE0Y0Eq1LWzP1R7gh4FLLIFQ13Y3LpLQP2uThLhPA926yS
         kxvZK/XGOUqZkoluRiZY7HpppjrkdywpUxVqf39fFuOwUmEvXowU3pa8DxrfjO46TDJM
         odbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU8ddTzJnQvYVlXyrtaxzEkdYoNIlxbp3V03NUdHm+8FepHpInAkDk1sqEZWSc2Ul5BtBIydLSvPzJIUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIeEDaTjEt33mGs25yPpzvUG8jRGMGJ3LxLJLJOvee7djxK4q
	XJiE2TpISiN781yKvj8ky9XBUGY+eMwgbiIiCSROkbfbuiXBjvPr364O7VEstbv07DXBsZ6WGIp
	SB6QdkMg=
X-Gm-Gg: ASbGncu/P9wplnHd/oPgFoNfeUV0ZbxbpxDCUQwX7N35a/+yjTbN1qrkP9mfTn1ijYY
	vE4m9iub2s9Do7JURXMRup436TEvMCT6EN3RHae0iXQSh3cE9w1T4TTcJDZL4hU1enCuUG4uzVv
	rgK3LeUiEok2htO9Wlx9Sur0g2ILHHBAnQOvRCokkJzNCSgu+v4psWes37D1WVmMOoLWTi22MI1
	OkTobe8uV2wt6Y0c7cnRUrCO4MR+KaFhwx1pk7Mxk/u1W1vCYv1RWh3VgIlUzpbpBBqCx2frDna
	YDYRIIG4At8X5jYNHiatrTFrNexe3MwoUYpXtDMIz5Wbjei5IWAsXeX+9LcBGs80XRDtA8BWGo0
	uzOTMEj1eVU+yp3Xz7buWVebLGpgERQwnR7tc
X-Google-Smtp-Source: AGHT+IEhHXEHhMCB8n+hItcLfGtfWs35UFsWJq8suFohBHvRl5x1bCyVgRPPFfwPKPcsnRPagV7q1w==
X-Received: by 2002:a17:906:c153:b0:ad8:93a3:29ba with SMTP id a640c23a62f3a-adea2e7f096mr414684066b.17.1749742038567;
        Thu, 12 Jun 2025 08:27:18 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb22476sm149239066b.90.2025.06.12.08.27.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:27:18 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so2476413a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:27:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNyVsqpRTFQlXjF5Uh75Zsqz8pFL94o1Tjw05DXQ0aCGmbsaccyO5jBKVcRY9RVlgAovldgUoaluG/iAo=@vger.kernel.org
X-Received: by 2002:a05:6402:42d6:b0:608:3b9d:a1b with SMTP id
 4fb4d7f45d1cf-60863ae566emr4109366a12.19.1749742037587; Thu, 12 Jun 2025
 08:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
In-Reply-To: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jun 2025 08:26:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
X-Gm-Features: AX0GCFvnTy6cYDrHALlLp1FFvPxTrHkuO-bgQbsdY4gmWtxJ4h-gyShDoTWTgGY
Message-ID: <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
Subject: Re: [GIT PULL] ARC updates for 6.16
To: Vineet Gupta <vgupta@kernel.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 20:29, Vineet Gupta <vgupta@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1

So this is signed and I pulled, but your key has expired. And I don't
find a new key on kernel.org or the normal keyservers.

Please don't put expiration dates on your keys and then not refresh
them. Or tell me where to find updated key/.

                  Linus
