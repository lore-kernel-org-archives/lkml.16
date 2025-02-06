Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC293198831
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864463; cv=none; b=Syt9rPZ0CU4Ok3f6gT+BBZ1hIHK1Yej8NxKVeDmcuzwgvPLRzgFQfDKCHJasXH6hVHbG7GD/QrmL3D1IDwnGjeL3HHlH/MJ2fcoRYKkO7zqcGlr/tsPvyDNPWO2OpA8I47dsvebwYG8SGmrPE1TA7DxQ4FS9hw2S14HOsK5FzLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864463; c=relaxed/simple;
	bh=yXEbeWeqjKA9XGHGLsQUOCuz+0M+Py1Hm7kwBlYjedQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZHPGF6r7srlVDtSy4ShD9nj5BiYV8yx3wpv2QR63kvPxmeBonJQJT7G5uCuDNoVZkBF3IlapOt7AdmQ/Z3a8cfsq+fn+n5SlsV0esMJljZP4D86lTQ3vC7d2KFFWYtLfj1Zf0Aos+iUh5NPj/3jJi0GLmnCaZaerQ9Mogn5JuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1C7EZF0W; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1C7EZF0W"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d06258e029so3935ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738864460; x=1739469260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXEbeWeqjKA9XGHGLsQUOCuz+0M+Py1Hm7kwBlYjedQ=;
        b=1C7EZF0WbDikys0zxntsrRX7OoG7NuM/7iWq9i27aV592t7GgKt/UJe1BPe3W4Hfsl
         KE9HPqUi+jx7G5O2X/zsvywxVz9kuj1N3WnW912BkdqxSpe95fQuPicTTnkcH1VOMjjG
         VAUD0Py+MVk5K+xXeTFP0iCTfdatN6hC8mI+zxYOcsFcnn+ioeNyRlifXPP49CSsWuhC
         OB1WnCDBzNBJXqBZ+8wOoSHVtdB8mgyvpNqtV7uqF6Yw4lj5gG0KtHPbq8t0qyKJlkou
         9qjZXu3TxikVq88V9qX+T4iop1hRzdICsJ0sV7dG/fF7+YlF9agtna6xM9pv4WKQpXyL
         EVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864460; x=1739469260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXEbeWeqjKA9XGHGLsQUOCuz+0M+Py1Hm7kwBlYjedQ=;
        b=R7kLXNC3zxA5nNC+ooH2k4aFRg8di6avl+hAP2v1jLo2DRCgTi8J+CNQQVlenX1mA3
         1k1iJ42p8xrW37s+E6RJ0O7/04hPlux5+v3uohBOtu+XD7Os9DWXW61YqRU/VsUiV0bu
         DN7wrXWan3M/XwU2mA1LXi0dpJVyBVqTl2hi55b2aeSD633D0REDEn5BC4Oi9cSWfsLJ
         +SAj04ozstW66GTRXA1skWN44cYYjM9aYV4BxGuXLAmE/o8HsguhZDULoRkfPodQxaAp
         jdAkq1AOybz1/iPad922djgVcwWr126wBkuLk3WW7Yh5JNA1MCk8i2k9jaYRcrGivKnJ
         CBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmagW7xZ1rDuNd35vDlW5GJPHntqpV8wEc8oWUIU9SsYOQQp9T/YxyxBGl1OfQtPLWD0MdIw0Kpj9YBTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNqH0R5HgipUibtZdAYZp26PUnkDeIa8j+Hy8e9EHVzcElipsd
	l//hm3aN+1EaYZqzZSXqdoZqShjD04q/TelrVsQkusTEBDsAlq4AUGdqUNDGDNY9k9EDooFZ04P
	IJO/CfxfGBh6OoL7zRQ2omcVd/UozV1+8mlmJ
X-Gm-Gg: ASbGncvFIB14mCrZkFHSxgalt2QvVZwngDoYbC/kUWW8Z//f7EeZMeO2sdg5V1sDiPx
	S6UMWhPwYVoEEvqXDt0dPh20rdFvT0qe6gcYJe7baOduNgJmNIZL6+5HBkgqJPG//BSelIXU6y6
	SDjQPKiUjYUifKu48v1/K2o+eI
X-Google-Smtp-Source: AGHT+IHjRfAEWOgF09ADnBFeQssh9J2LLV+7w2g1Ey2qvdksWuX/fXYlxc7n2cyjQutjoGNaI0Pi1u97ZrsTCB7CmCM=
X-Received: by 2002:a05:6e02:3113:b0:3cf:cedd:b5ea with SMTP id
 e9e14a558f8ab-3d135dbd377mr646515ab.7.1738864460397; Thu, 06 Feb 2025
 09:54:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206113314.335376-2-krzysztof.m.lopatowski@gmail.com>
In-Reply-To: <20250206113314.335376-2-krzysztof.m.lopatowski@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 6 Feb 2025 09:54:07 -0800
X-Gm-Features: AWEUYZnIi6UrXFoluEJsHxcLNKVze0a8CepMT-61FiOjqL1rQAfhVBDuQsJX3Ow
Message-ID: <CAP-5=fXV6b2g9QxPe1EsSTcHZpSPq+EAR71jvpBGW7ehydN+Uw@mail.gmail.com>
Subject: Re: [PATCH] perf: Improve startup time by reducing unnecessary stat() calls
To: =?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>
Cc: namhyung@kernel.org, acme@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 3:35=E2=80=AFAM Krzysztof =C5=81opatowski
<krzysztof.m.lopatowski@gmail.com> wrote:
>
> When testing perf trace on NixOS, I noticed significant startup delays:
> - `ls`: ~2ms
> - `strace ls`: ~10ms
> - `perf trace ls`: ~550ms
>
> Profiling showed that 51% of the time is spent reading files,
> 26% in loading BPF programs, and 11% in `newfstatat`.
>
> This patch optimizes module path exploration by avoiding `stat()` calls
> unless necessary. For filesystems that do not implement `d_type`
> (DT_UNKNOWN), it falls back to the old behavior.
> See `readdir(3)` for details.
>
> This reduces `perf trace ls` time to ~500ms.
>
> A more thorough startup optimization based on command parameters would
> be ideal, but that is a larger effort.


 Hi Krzysztof,

Thanks for the contribution! I did a series and a new io_dir set of
primitives. The last version of which is:
https://lore.kernel.org/lkml/20231207050433.1426834-1-irogers@google.com/
That did something very similar along with mainly memory usage
optimizations. In patch2:
```
+static inline bool io_dir__is_dir(const struct io_dir *iod, struct
io_dirent64 *dent)
+{
+ if (dent->d_type =3D=3D DT_UNKNOWN) {
+ struct stat st;
+
+ if (fstatat(iod->dirfd, dent->d_name, &st, /*flags=3D*/0))
+ return false;
+
+ if (S_ISDIR(st.st_mode)) {
+ dent->d_type =3D DT_DIR;
+ return true;
+ }
+ }
+ return dent->d_type =3D=3D DT_DIR;
+}
```
I stopped pursuing the series as the maintainers were complaining
about unpopular libcs/platforms missing system call definitions
(getdents) and the series breaking on those platforms. I tried to go
the usual feature testing route, etc. but we seemed to have entered
into wac-a-mole wrt those libcs/platforms and my patience had worn
thin. I carry the changes in Google's tree where the libc/platform
issue isn't a concern.

I mention this as I think that series may be a better route than this
change as it solves a little bit more of the performance issue. I can
and do rebase the changes for Google in the tree:
https://github.com/googleprodkernel/linux-perf
I don't mind this patch as an expedient, obvious performance win.

Thanks,
Ian
