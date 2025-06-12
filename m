Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551911CDA3F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719258; cv=none; b=lxN1EdK1YdIQbJYHVQeOa1tlhBoy1PbJXvrX34//fwNEafazutZxIkDeIbZn0psCN9zFIWcOam8OoEvSPq8x0KyAF8w9pNvl5gHN43Adr75Dohcq+haU/IPMlr02bwKJYPeZVvcskRgN8bJkcTuMwvhB2yPRX28D6r4ViLIAn54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719258; c=relaxed/simple;
	bh=y6b6QvQl+bRwXvl+wjLTqMdjZCkwY36Ul1Tt+SBOz3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhHpOhIOx01JBAIw6mHta1bdzriszfJw4eRg/DYFcoRIqw6OrvQ0uZMJwX0X3ZZuXI1IdGWJ7i0HJnN3T7juGqueeOS9zSoZzSgQu2OZ9eqfcN08+g6jDWCURf1mtZCoOWsV2RsAYiY85V3k06SlvvaJ084KWZ+MFhRI+augI0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=nQ+delIt; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="nQ+delIt"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d2107eb668so118262685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749719255; x=1750324055; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y6b6QvQl+bRwXvl+wjLTqMdjZCkwY36Ul1Tt+SBOz3g=;
        b=nQ+delIt/jYSezvzaZ+DUltnffOECMTuv8Ll+traN0KVyGnPWehTsqQBfzCFQQoXuh
         JNbncd7vuton5M92AjJViNoD5+hh4SysIRFzewxg6NATJ/C5KsVJVOQsz3M2U6eBBv+r
         9yfT7LmJW/QnjFMrjBN/YOOZsYFQKV9vCMeF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719255; x=1750324055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6b6QvQl+bRwXvl+wjLTqMdjZCkwY36Ul1Tt+SBOz3g=;
        b=BtV/VA2zKJui7yR1JMdwcasT5KMxnkT5TKDKRXTGlCbD06oMVYfD08rllN9S0boGrk
         +48fw1fIwjWwU2b6Z0JYHNR5a63ffzw7y31mVftt/e8olcsGjIJWKFbwseP4uLnmmyhO
         +a1It1gBqERMm4lvbohMnU1FJyc7zJQPE4nP/JDLZ9fvrkDjPz/PEf1BRpjzBdggl2ds
         yW0HybAx9/Qy+jpv9HZTMxaK5k5FgFB6qXDH3vQbs2+XA595Nd0Bz/R1+z0yUOnXHcoP
         auRqk3Do6vrlh42Ldx+ra3EX3K6cKtKj3AXMHjpjHlzQ528k/OueEUQSoC8lrPH1fHcj
         xrdA==
X-Gm-Message-State: AOJu0YxxXFuACd13JZFYqa7f3pcZNNXXkhp++xJrdjHK8nC/5G/XBXsx
	zjOUWYNJ3uEzrBjCmlJevQ+4JWVXNbJ61J3Y7aWDzWnxE44KIlofqNflsw6R9UFGqInztj2rpx2
	Ko4mmKPIOr5YLNG/vZK1pUFqR9sZZVRJA1lVc/UECISUWZgbRp3f3
X-Gm-Gg: ASbGncsRaSNB4C/AnHCzqrLJklDp/klIkFdV+JuFrLG+WQymACIsYpvGPp5/xWl4IsM
	MbXjdrhejkBR2OaHIr36Qp/dVFFDwKTIFXvZeusu8yhYp13L8leBH0kwsAWr7WnnXZZnTplTmak
	KJ0L+A7LloLqO+1EH1miSeRcmVsfpAnsWF3Sx71/buxkFM
X-Google-Smtp-Source: AGHT+IFOnNrzWjLT5ibrVv8Y2BGK48j7B6UvhBgwO8fx8UkM8EQpMGJyxzvavWuXra0V85HOmQFH97ajXAajekRIaps=
X-Received: by 2002:a05:622a:2596:b0:4a4:2d7a:994b with SMTP id
 d75a77b69052e-4a72293dcadmr52269271cf.19.1749719243891; Thu, 12 Jun 2025
 02:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612032239.17561-1-bagasdotme@gmail.com>
In-Reply-To: <20250612032239.17561-1-bagasdotme@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 12 Jun 2025 11:07:13 +0200
X-Gm-Features: AX0GCFsOlxUaPAtzGm57tBtxM91bCOFZq--Te855323YXxbAnNwlfNn2nirhb38
Message-ID: <CAJfpegvKvKB+1Q23Gm8TKAmb4hPNnSHpK5W29JmDjHVWrWk73Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: fuse: Consolidate FUSE docs into its own subdirectory
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Luis Henriques <luis@igalia.com>, Bernd Schubert <bschubert@ddn.com>, Amir Goldstein <amir73il@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J. Wong" <djwong@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	James Morse <james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 05:22, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> All four FUSE docs are currently in upper-level
> Documentation/filesystems/ directory, but these are distinct as a group
> of its own. Move them into Documentation/filesystems/fuse/ subdirectory.
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied, thanks.

Miklos
