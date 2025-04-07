Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50FA1F790C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035888; cv=none; b=t6MF+LbQ38tl/Zr5WqVUDtjzP2xJDC8+MD+MapMFs7tBjnuLLibXk2Nlnz/mZ70R3JUcNRnDNhl+UptiycF6+09aMWNzec1SgljyxsXyLucnE/XBjlLnhbBrFjlKSy2r+EIeV07xphd18fSnNLJDbARlMGuFEeKwlFN8lyJs1b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035888; c=relaxed/simple;
	bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFGRb2pyikfA/B1ZG5bHuK3EuDLv9R4Bpm1Acyq8GuJ4rd45dldjlJf8jr8dQDfcbZCPq6FynBaQuCKgnc5huyfIhZVvdDivspMFbzbCk4t2jdu9ughPpxmzOoa+X4lBUuFfpuFrrrNoXiXW3nLM28+gRZ6rc0excTZPbCA08zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=HekbsPYU; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="HekbsPYU"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47663aeff1bso39611411cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1744035884; x=1744640684; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=;
        b=HekbsPYUXk7zhTOruFnRnQckKhfaxTWzEjMmsaJBlgqabCZ6jjZ+LqGVA1xI/whr50
         LIx8t49SNes4OXnO8Nr0MCEy1a+9jhSQt/D1vYdIOKlHDUTcA0QOF8uLj6eKXxnWFsXl
         hSW+mdJEr0QcPCOm/WX4dHqoW581abar4frAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035884; x=1744640684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNL+NAWFI0GxoBJ167yJeoBFSWA7FvYgScloIAzLUeo=;
        b=OaHk5hzyox6hbIm0IR+Ip+YqqTdE+j8q8gXpA5O8CCASKQDm0kis2EPGocOBmIMluB
         AcCszCSfm5j1oHoJlAImvCAM5jzPBozRoilE56CeexCjn/Gz+dcpXOkzTNu9pMBUo3od
         K5fBvfXTwroh2Kd16nA8OfiqyqMkPfgyTVGretM7fI9chMXS4E2EaDR08piJtO6bgokH
         wO6wVDz06J247jcWhlv4OLLBvxozpo2arSnLoXwRkyoEVUrh2t+06bweKoE2aLF8WAlB
         g763wEpyrp2XjrdpQtIzBTJhOMj+ZTKzVKh8oG6WVM7WcnyyJi6BwT06AoB36E+EmHJM
         QWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvgdup8WJ3LLIQht5uIpZTR+EddI2yyHR5QyJaCY4miMk7ECIbSUO6KeC9QE3WT7mvjLtvCafvQuTKkVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CA0kD0L5NVx1o17m7/4fxT9H6xBy3DUdl/5hG9UVHdlIl0Ne
	hx6f1r7aHQkQFqjHYFHo8uMEnD5WzQdRLdxFtyrNptczVb98+jrMn+BVJ8QjEzt/5T2OQJeyzE4
	zuHuHTJubbcoBWbkoxLH0WhAjQCVUxF4Xvn1ebA==
X-Gm-Gg: ASbGncus5GwYWOdNFHU7cxAlaQxZbmWaF7YmBBabnLup5/Oz3xIVx5EHUsBFpIThLdD
	fkjb6/szDaAb6EhcLZPP8+j5OQXb2vqgWGlT3qHivNyYjVylmOEnNii9LNIB5AqVqjfRqI/D5Nv
	ytXO07NFI+b61gCtRzXCwB69l9Gtk=
X-Google-Smtp-Source: AGHT+IFQd4jHNyMbSuzJ059jvOO/iExVzCO/KphR667EKFZiLjHNp+k+91snAGwPCrKp9DxvzNZfuI0F/c1qQXQ410A=
X-Received: by 2002:a05:622a:199f:b0:472:bbb:1bab with SMTP id
 d75a77b69052e-47930fe7403mr104524641cf.24.1744035883851; Mon, 07 Apr 2025
 07:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
In-Reply-To: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 7 Apr 2025 16:24:32 +0200
X-Gm-Features: ATxdqUEaLGT2M3QdvlukIOwAEuscXulm8_kXjOV6iVYrWf5p1vewCG0W1HdKGiE
Message-ID: <CAJfpegsN47xDbVFsu=-TLW+A2=-33fNY83zt5bhebFqH67LAVA@mail.gmail.com>
Subject: Re: [RESEND] virtiofs: add filesystem context source name check
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, eperezma@redhat.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	benliang.zhao@mediatek.com, bin.zhang@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 13:51, Xiangsheng Hou <xiangsheng.hou@mediatek.com> wrote:
>
> In certain scenarios, for example, during fuzz testing, the source
> name may be NULL, which could lead to a kernel panic. Therefore, an
> extra check for the source name should be added.
>
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos
