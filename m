Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009622B8C6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805296; cv=none; b=ILKokvy4VNiIQ6ffKxT0zGQ69GPbhUpJ/L8N509M1o2pDf5bRnfa3vHnu0vCOPgO4yaPzD7W0USyFW1YG9LOqYrbuh9G6eEuQhmu/L7nNwlDcD9AKe93Mi74mZILEs6zNdTkJuHhsKenY9bb1yTvGEJGgej/SRCYrFVRlnYN3WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805296; c=relaxed/simple;
	bh=S1TcFhsO8IuWax2qpukdjZEEzxsOR3bhYcd+kz01eqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcTsIOasUZaunWh6I0K1Zto+w3s8OYSvsUQKcMP3Hi/JAaXO4ufAQ4dBV4lYn0hS8OAo3wMsZlLxdKPRdXfJ0GRTBAZ5hfyAPWTZpuBxT5rvRQbq5T0nbbHraEn9AZlaJArRTpNXmL0kCrptea2f6TX6I2m4HqjcIO68L2NN/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Cg1T+LEB; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Cg1T+LEB"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-477296dce8dso25107761cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746805293; x=1747410093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iwHQGzvOP7v2YH6Hs8V0N89gjwgRW1O9VhViKG5Uyck=;
        b=Cg1T+LEBiBcxOd/4ndzM1VerY+G9lm08mpDaZsAJY+CE6WJGml5o3J1WhIyuQdUr0i
         5TZYVtmpMSA5i/r+AM0HNDIfClIh/ymOPdj6PVzNFJFU0Jf+/ZXa3qfHvm5pkhIzYSGA
         7fHJ+hGd0iD9nCTnFg1MuTGmGE/SrtijuYFcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805293; x=1747410093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwHQGzvOP7v2YH6Hs8V0N89gjwgRW1O9VhViKG5Uyck=;
        b=oUr4ybbUQewIOqEoM0QW9d23QqZYLOqjWPfNPa7qT1crRTuF0XQpBk1kKT8hbZGVqh
         OkLz/U/LdiR2YGoGIrDSvpHgw7Eirm8x0h3WrOcSNzc+09dLH2fGkZh11kndg1n8LPWE
         cHOVi+9ufH23AUXdLtJf03+b688SzPQOokq3YdWXEflp64+M1x0vYoke/xPQOazC/jcZ
         8GJBZ4rgBQbo+rX+3rVVE1CJtfQ/39xMb+8FJNaU0485pd/eWaoxfSkDEWrKeRax1F6V
         YPF0t/1WzHX2MlBKR+1XnlU7YCaC+pSng5la+fcoVz4VA5yY0DGjab2fYltyO4XuHXHP
         Tfvw==
X-Forwarded-Encrypted: i=1; AJvYcCV4aYcvEwDx7aO2Wcd/RiYRyL44cFXQ13YI+VZAJh5MApEZjoo3CSNX0hMTLl0eUplsxQUkYMPU0ByRAjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzygcz4POc2lXx1WtmsSU1YMrG4jfbAzgctk8z0zq1Dk7WGoIlA
	DwUx3bohDfXU528tUCgwObR6QdcBnzHQcsVhz6rKcz0grPO5bZq5S5EuPodKhjIpQVfkpqughhV
	wjW5yji05lik4UeB4V8cMp76wYLbhgYFZLKQc8A==
X-Gm-Gg: ASbGncthYFZx2SqreHd7D6K37wviHMjoLuLCQiZaRGzzi/dpXwv+5xf/1L+888pLDs0
	sG/9HQTIZVjXBCqEfE4Klp/ncB2X2/cQwU+eDPP+jpg2IUQBCFew40wFWFHMBj3+ZjifdpnLw2g
	TbGBG9xR5lTZe+ZppFqAqZQj7l
X-Google-Smtp-Source: AGHT+IHie2mMkOwHaJXzlXwnOBktp1YsWcPyKpVoybowMoCHOLI8z4YHYt1gX1w3k9K4VNdADMj+ALV9TflztfXJr2Q=
X-Received: by 2002:a05:622a:1481:b0:475:16db:b911 with SMTP id
 d75a77b69052e-494527f3c22mr60158151cf.52.1746805293253; Fri, 09 May 2025
 08:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
 <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com> <CAOQ4uxiBLc9G+CvU-m5XMPbkFJLeCt6R86r8WaGEE2N3k9_qrw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiBLc9G+CvU-m5XMPbkFJLeCt6R86r8WaGEE2N3k9_qrw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 9 May 2025 17:41:22 +0200
X-Gm-Features: ATxdqUHGurym9NMfs8N7OJsvJs7tgZIOweBaG78XipqocvUE6unX_cB3PETlOXo
Message-ID: <CAJfpegvaCTxS_wC6EGFfh3Gim5DEgOtuju=_=qCsouzkCRvJog@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Amir Goldstein <amir73il@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chen Linxuan <chenlinxuan@uniontech.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 17:19, Amir Goldstein <amir73il@gmail.com> wrote:

> I remember that there was some push back on this idea.
> If there was no push back, you probably wouldn't have written
> listmount/statmount...

That's true.  IIRC one of arguments was "we don't want to parse
strings", which is not relevant here, since both proposals are text
based.

Not sure if there were any others, will dig into it.

>
> I think that for lsof, any way we present the information in fdinfo
> that is parsable would be good enough for lsof to follow.
>
> We could also list a full copy of backing_files table in fdinfo
> of all the /dev/fuse open files, that will give lsof the pid of fuse server
> in high likelihood.

Right.

> But this is not very scalable with a large number of backing_files. hmm.

That's one of the reasons why I'm advocating a hierarchical
alternative to the flat fdinfo file.

> Is it a bad idea to merge the connections/N/backing_files code anyway
> at least for debugging?

Maybe not, not sure.

> The extra fdinfo in patch 3 is just useful.
> I don't see why we should not add it regardless of the standard  way
> to iterate all backing_files.

Ah, missed 3/3, sorry.  Will review that shortly.

Thanks,
Miklos
