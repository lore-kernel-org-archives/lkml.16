Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EAC1FE444
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834340; cv=none; b=FIrP8xSPy+NNuKIS2fEYb4PrpQw1wnzJAc72XjNyjhwULHRAph7Z9l6HfTAnUgRxyOaembb6bd5cv8aC5dm/uRTa41QJE+s4l5/3MczjFIJmpQkfB/Q2Z9BLnJrkqmTEd63BP7yQeDCt5G9MfGwMV5b7boCFVIQ6nge++/+3nWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834340; c=relaxed/simple;
	bh=b2ZJMW5lXZXMKRjSgAFdB4o26nqBJxjc3NGqIiPi7Sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boa7qt1Sdv8VXteTwpQnibhiPEQfwrmQkLZ+J0gs6r4YMeZ6hl/ckwYFvOeI5y+95v5+A5ez/JjGPl6MJXaa/AP3/OJDDXvWgbCnaAm9qIZ0wrPooppkA6AmvvYWHezrHJZbSDl85KTgYBTwcS3e7e2qqf6OlcuiuMC2uJppdmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YNdFT4RL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YNdFT4RL"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso4892787a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749834336; x=1750439136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y88tolwqWhLyuX1+hS8D6QG3M/uv0eDirRGzysww6ZA=;
        b=YNdFT4RLg3aEHAbrWvLw89g8sGiD05vYIkQg/TRQfTi7o7nccoGLWA5i5I7HTdgkKM
         xdCdAzg3gEsJGVI/6W1HCzeMOGvk8aX32eR7/s64nxviYOteA/JELuaNEEMT/xn6ToTA
         BbmJLgxT3gtUtfmI/ymmkDSAA2J/LTAR0MxZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834336; x=1750439136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y88tolwqWhLyuX1+hS8D6QG3M/uv0eDirRGzysww6ZA=;
        b=EpqivkHBbTUdKLKFFeneoaMNGpTHi8MrGhGoav3j84Q28KEB9eydmNln47iy1x9q02
         +hVC94Njf9qYaUbsSKwZvBR/s8nmfOWvlshk8jxjTRdEg+Jsq7ONafx/H8zAluRDh1wk
         jDtI4r6sxAjIPkXTn8Er2SkAoLIrafgpsOQFySpYRvW6gZkTQSj5VuvlbwOBwIbUtE+1
         bW3I07QLluj1CCJMQhV4tVvmxCWeWg9yjiDio6ibUeW2/UcTg+j4kJ3tYN4HMSZgOjOq
         fE0xGSpGO1e+h6aO5tF5i0jrTWVOTZNRsguOAK5eLzVEMc3VceESWiJo5s4Oq/HPI7vd
         Iiaw==
X-Gm-Message-State: AOJu0Yx/rX0Nb3z0xGddK6FwGencXypNB9av4+g2+iCiZ3vZRCKv2D9+
	bQegbQ0lOVzo2SphJN+Oa1yltK8kiC80DqjERZlbkaBBcjel1bu4MhaWJ6OtEfQYFMtT7RZcXas
	R7cH5EcddjQ==
X-Gm-Gg: ASbGncsC+OasU9SPWDqCI1Pc/MiJ137Jxtc424jLsYYObrrJzb4P+Ez0iWNLHyxrwwJ
	pzZqwKTBFD7ZaBnNZekei09PJi97u3mDzwoXWuKMjMiSoKgGvBEp72/NCHOvMSI7QkqZ/BRfL5h
	kFOrizUWih2Lt9DQRzC9liJAG31jjM+FsOazWRF5oYmUk9+v9MZJ+qZ0/r9yYgJvp0satM7tEsU
	guswfwH8D9bhU+Hq1dD4uCNA7HgjPk30qjLOTGXfyQ/EZO4caPN6h16OYtGzZkjVny4BVQGrdPj
	87APJYx2ce8qp/SHg122Zxeuama5PW6axAKvTOcC5IcEdjKx4Saxj6+IfgVVmZ/qevt4QMX3uym
	dDZCkU65Q0Gqlm+KEhH0+78x516KO86tnWEze
X-Google-Smtp-Source: AGHT+IGXy//42CTdpBer5QK3c/BSj699NV5N8kgig+S/mwTp1gUmP75rk6mw40rq/LNlUaNLl1oRtQ==
X-Received: by 2002:a17:907:97c3:b0:ade:9b52:4da0 with SMTP id a640c23a62f3a-adec5cd868amr257699966b.60.1749834335565;
        Fri, 13 Jun 2025 10:05:35 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf60967c9csm48313466b.33.2025.06.13.10.05.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 10:05:34 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so3918186a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:05:34 -0700 (PDT)
X-Received: by 2002:a05:6402:348e:b0:602:346b:1509 with SMTP id
 4fb4d7f45d1cf-608d086167cmr24519a12.9.1749834333822; Fri, 13 Jun 2025
 10:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613114942.61ee3dc5@batman.local.home>
In-Reply-To: <20250613114942.61ee3dc5@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jun 2025 10:05:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSsH7EwNbyKrMOuXs8RRN4CF4WSzxtL8w3vOVxX7+16A@mail.gmail.com>
X-Gm-Features: AX0GCFv7e4Y8lXtPbbJ73OZ0hvAPRJZo9SWNRYp1xMdT7sFE2gzVI1nsSCi6EGc
Message-ID: <CAHk-=wgSsH7EwNbyKrMOuXs8RRN4CF4WSzxtL8w3vOVxX7+16A@mail.gmail.com>
Subject: Re: [GIT PULL] tracing: Fixes for v6.16
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 08:50, Steven Rostedt <rostedt@goodmis.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
> trace-v6.16-rc1
>
> Tag SHA1: 3dec58ebef0af8431ecffae2b1814a11b86dbde1
> Head SHA1: 8a157d8a00e815cab4432653cb50c9cedbbb4931

I see the HEAD in the 'trace/fixes' branch, but no tags anywhere.
Forgot to push?

               Linus
