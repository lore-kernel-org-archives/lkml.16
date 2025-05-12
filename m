Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC0257443
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037455; cv=none; b=ZcTjBMlWqnyXwbWGOHop1zyEGPhMP1qHhQLX/VdnA2xkW8KhoFVraErz5CFNKXsXM35OOAmsIRKVJoIQwrmNe4HiZtvopkQYmwWnzO7m0KHImxtEnSD9MVmNMf2z40dLLbczb/7qNN9Y2+Web7zWZH5L3wOdyNXsKhAt77sKCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037455; c=relaxed/simple;
	bh=BOP6Uw6zm7kXZhT9LMuJCWcMldNLHWkHgkN3+glNCvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu3kWeGb7sqpsQ0mVi6wyl36VdUNG8RET+yonbmK4PkEtmh/Ch8Yp5BRiwjJ8v1VDxw59BKwLKPx2E8wRPI2DdlnZFEYmweGWArefzGfJwecpA2wX9duoSMR0VxuFJ60l+Rqs93udU3+6jj5Y09sqz/YnxMg+T19t3pOR/ISFJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=QuDg+Yb4; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="QuDg+Yb4"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476f4e9cf92so34696661cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747037451; x=1747642251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BOP6Uw6zm7kXZhT9LMuJCWcMldNLHWkHgkN3+glNCvs=;
        b=QuDg+Yb4FoyhWZ7CnOsbbrw77oYDZczjXNHd4CPBAR899TYUPVigb8cMBnwHxItjdM
         c0Zkpa3CBi3NVC3qQifXIdqVuNk+p//XpFEaIIG/Y5RnUL+M5BwsVUf2CkDXflr968GV
         70EpHTuFgURd3CGYTtkY1cATZs9tVXOhOCiKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747037451; x=1747642251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOP6Uw6zm7kXZhT9LMuJCWcMldNLHWkHgkN3+glNCvs=;
        b=kaGY1FkW7aItF66w7jhcBCcH1g0nQ9/5qB2laV4eoYStOTwCa6yKxqrlIrImTe3CXd
         gPE1SQ6v1RcADh+b9I+u6qpF0os22Qjby+sg6sQl8Q5iJhIaC65Fpmf/90okIU1CsYjo
         xzchWJ2BppbHH1ZYWhFG8x4jOd4yEkB41euqck6sZs8VEBFxY+9IwqyKnMgW0NhFPZxi
         uHIan5pMm+doRpC8ZAov9VCzmcdMaSM4MnIYScblCxPROfFp+2pUQhgMpQzAvgyIqNGV
         gTPOvWXxOkSe7BjnhKAmgkveO9bR+rs69VyMhzrFvqUf3lzLAjkNS2XCGFIDp+Hn5QcT
         rnIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdMo3tf8/Y8WkfNc9M1otSnlaLrZ1uagL6W8zevUmPaj65VkmJv4Yt5u1JCLwdzVb6Ib4JO1LETVi13tA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvC6PsOyVzWnK1iapvdMxMcS9DY5zgvtd+8+rqCs3GOMiqC/08
	USdfdl9+G1crGI2SrfZwxAdWcGu1Xp2aZ/TTrSbtHbTX+DlgVgUd+NJm6gP45LRE0PfuT/UAqs1
	nvwSH9gfwSkk14RxxqR3Ubdd+NNQvhW2SNGvenQ==
X-Gm-Gg: ASbGnctk1Bc0eCnPMzAcAIjyGKgUqD4R/AUsAz9AQApUe0vz6CFu5T8emIzTq/h1Jmy
	DSEixBfkugdaPX3iQCxvL3Rz92jmVw+9Ur8TEGHEjZDPgD+RLaGPFIK1dkFrm5+IRx3RQpWvP3E
	AIqUWLxgDRLoitGEG5eQQ5rbBPpNosafxzmfHbPcCoGlCkSw==
X-Google-Smtp-Source: AGHT+IE9riVAa+kf1k7H/s/DMg0+dtkLLuYpL/QwjZJPyX/AyxDSXkoHgrrw6V5TpkgnV8ryhPngQ9J6/WtkR8aF34o=
X-Received: by 2002:a05:622a:30c:b0:48a:e2ec:a3b4 with SMTP id
 d75a77b69052e-49452744396mr167098991cf.17.1747037450856; Mon, 12 May 2025
 01:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-fuse-passthrough-doc-v2-0-ae7c0dd8bba6@uniontech.com>
In-Reply-To: <20250507-fuse-passthrough-doc-v2-0-ae7c0dd8bba6@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 12 May 2025 10:10:40 +0200
X-Gm-Features: AX0GCFtoLXIKOqkBSTvl2qMeCrxjYdfhogIog4A5r7OHYgoDzEDxfLUMnrE1sJo
Message-ID: <CAJfpegt46sKDJfB0V=1Db43VjoZQ-nxHuCVQU_k-A_AgxqnPVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a documentation for FUSE passthrough
To: chenlinxuan@uniontech.com
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 10:42, Chen Linxuan via B4 Relay
<devnull+chenlinxuan.uniontech.com@kernel.org> wrote:
>
> This series adds a new file,
> Documentation/filesystems/fuse-passthrough.rst, which documents why
> FUSE passthrough functionality requires CAP_SYS_ADMIN capabilities.
>
> The series also updates the MAINTAINERS file to ensure
> scripts/get_maintainer.pl works correctly with FUSE documentation.
>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>

Applied, thanks.

Miklos
