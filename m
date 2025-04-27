Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD7D79E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 03:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745725785; cv=none; b=Mv6rPm+UAJ9ci4rpOAh3Og05zahtib6rx9lxysPFO5De3iza766MvpNzjdftf6f8SgpvxHGijlAU2Xev1C0l5IZUbfjWKZb1evFHoFYxBGVak/bY9J4x12O60fM8vYIRi31jeTdYOTA2UNMXNlmVkxH0fC91ZtxdZJEbI/qLHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745725785; c=relaxed/simple;
	bh=qPkzetfbsQMJdz/hEW7AqlW9AFKitXG3ddk50x54yk0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjPvxBnJkQcXo+CsTuWaihvGvmG3E4PeECfo/MyOG1JU9IDt9DwsvYUj5jP9ntbAS2xFVy2isSlW0bvBfj7jBnSZ4qVhDfedya8QlOeLWA8N35xl0ZYJ9X9JG3jhrI/5c5AhXIjm/2hNxLvDKM+Pi+c5sBB2FUtzl4Lihx2wrZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrrwUVET; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrrwUVET"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3417709b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 20:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745725783; x=1746330583; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0liNNgO8yCmpr/Ek9NDR8pMTH9T2ZF8jZq+MihsfUw=;
        b=TrrwUVETr4H6MkZMCtLD/GH6LjNh9VQHEIQbOQI1ULI6bV+J48Pcd/1zHwxoABIr/5
         oQktZ3/3yfN/4Vb5JrJuOurbuaZDZOuMpg3fUXcSdh4BF7Kf2nPHXHjK++5350mle5b4
         u23s2V+QSN/9xDVSUbhF31iMA/sGKj4G3NyZO4+0B7WWXl2L/76/PC/AaZgLZ7oRTLYU
         pULItcxGemFbpCgoYeINJijFYWjG1rFq4gnNY9xYazZ5/Jn3PgVpWKih5JqI+xEGAl6u
         e1IAAzBgaXCBGLutQTG3dYH5JLk0PksKTzsnLJXSdmf0or/hTRoYGBLKVPvQcdyXT7i6
         CeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745725783; x=1746330583;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0liNNgO8yCmpr/Ek9NDR8pMTH9T2ZF8jZq+MihsfUw=;
        b=celnXbzH618wyED+xFwJufl5tLRfLLluFe9I8Thev93a6LKpTDwBVzCzRJYE5Wld36
         b+Z7bkxAa0lz67BlwdwYgED+YfuM6phHE/G8ujPVs/z5mx10SMQho/VSmcFtw8Jsdqs0
         TCVCUfvTTijpT550a/yjit5baaLez6SlMkzXmxJp1jYVVo3xsZor7F7hv1x7oImgLkQ8
         XrFBY2ADKqS6qNiOTWYx05JXobZjM+ZuaTva78rHlfIAYTV90L6SOUEobbdzeZ02OEYB
         /SDGuGiMVNCjh4aeGKUZTC3wxeCXGxhw06tg/LzI1OlcDDfNF09imy8h2fc7QnZPZ6es
         2iYw==
X-Forwarded-Encrypted: i=1; AJvYcCV+FIWSx9yhCojUn9fPWTiEFQuVCzMhv+o8/mhpS9+3Q27wxazxqCcEYApxaD3xOqgA8c8MUhjM0Eof3Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBivhIptb4EQIyFBLOsa8r1R7bWx+opEC0TUTxpL2g95D8jjpT
	QChFC6KSHuvTx366blDDFt0CQ8Gj8eo5EWhFEtqpg05KgGXUg/Ld
X-Gm-Gg: ASbGncvSQM+tM9ZwWA7oaBauJ9UPubivJUrAcfJ4fVzD1qPmndKQq7LfTjV6CFbQmFW
	JsLojB2GwmZ5IlqvNNnzJh8jZhDYctJhIQvg18C5BdQzU3p0uf3VjSvma7d7cJRH3WBS2aQFcTR
	7wPJAGULkbySgv5rbZl5oPNuWN7GTBnp2shr2ugF0xFlY+47G4ERsMf6tEOkgvdyfizI/LmOlWw
	QMyES+lGiv8RiNqcRFRAyuU4JVGs1bEnEaOjEkeT4MdrKRjD1BfImK1dIoT43nV7TKVMKusYU3A
	um3xrnTfBFHPWn228xxQSHfzrW03pmtcqDiP6wa59O3DqQQZ2HhHzbqAuvC2SviJtzAf2/2bnk6
	c4tvgI3bsIRecwd0XFHUKOW48
X-Google-Smtp-Source: AGHT+IGg2OBNxa/r9pyJD2HKQU+dGIALRor5XTPgsOgb5qPcwU2NBzrrOPOxZIuDg63sNGyeTdZ0MQ==
X-Received: by 2002:a05:6a00:21c4:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-73ff736a239mr5801031b3a.15.1745725783149;
        Sat, 26 Apr 2025 20:49:43 -0700 (PDT)
Received: from mars.local.gmail.com (sp1-75-76-170.smd03.spmode.ne.jp. [1.75.76.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aa16cbsm5544777b3a.155.2025.04.26.20.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:49:42 -0700 (PDT)
Date: Sun, 27 Apr 2025 12:49:36 +0900
Message-ID: <m21pte6z73.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: lorenzo.stoakes@oracle.com
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/13] nommu UML
In-Reply-To: <f4242067-0113-432e-b8d1-d26ff5e4a355@lucifer.local>
References: <cover.1737348399.git.thehajime@gmail.com>
	<f4242067-0113-432e-b8d1-d26ff5e4a355@lucifer.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello Lorenzo,

On Fri, 25 Apr 2025 22:49:31 +0900,
Lorenzo Stoakes wrote:

> It seemed this series died, which is a pity, i'd be very useful to have
> this functionality to aid in easily testing nommu in mm code.
> 
> I know that I pushed back a little (or rather - wondering about the status
> of nommu in general) back in v2, however with it confirmed that nommu is
> required, this series becomes really quite important.
> 
> This would need rebasing of course for a v8, but I wonder if there is any
> appetite for it or why this didn't go anywhere?
> 
> In any case, if you are still interested in this Hajime (thanks so much for
> all your hard work on it!), just saying there are definitely users out
> there.

I've been waiting for opinions from the um maintainers to the v7
patchset, and am ready to send v8 series with rebasing the current
uml/next branch.

I believe the v7 series is still in the patchwork queue so, I hope
it'll be reviewed soon.

# thanks for the information that this feature is useful to test mm
  code.

-- Hajime
