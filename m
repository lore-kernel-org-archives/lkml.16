Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A0F28B50C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300123; cv=none; b=K4lP9cs67NDCku8Fc/qTA2kJVohiqVtobZOC2ZpszbQ3w6aDsL8pYR362rWBfjzVetyzVUg6rAs27GL/9xAN9KRwGU0hiQxVy75pAW0CqYHYlgJ4ng7qqhsp7FNt3oXIa0y9y6+Ka8n9GWq8iH26a+5ykfjmyNsAYFXRThNCRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300123; c=relaxed/simple;
	bh=r0Bfm0Lezye1VJKZNFB69qPGWLtUKXRzwk7H9jXE9+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyGSeNc1TNOuW2jO2L+Ur6B0XgNkK93aCAWA6oI4ItMkRYvGbR12KkX7wexxdZQXchAYOEkv0vxqCYa3Yilwxenke72gvZWbbqsf2/s1PwoDG62kLjhwnQgH0b2OPndA8k7gP0lJ9A2F59bQGZZDbetaZqfb+OjjEJ2wUoAsO04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=kxG185Ku; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="kxG185Ku"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47662449055so4280671cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747300121; x=1747904921; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a7hbQxVqZsERj6YIejzl29wad9VM+LlegwZENNoI5ks=;
        b=kxG185KuCVqdmN7clDvmPB0sTKqOnmQ+w6BdUtwSZykGmfCnhJldDRMX3KnZpAtPd8
         VoMbmEmQqDq57wnS3DfoNVfrI4o19Yt8hRTYmSYAEoHXt4Fb/oNrgh3fwC2h5zqEbb49
         X/xoTy/H6TDTC+liBxyUhUjAV30dASqkywAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300121; x=1747904921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7hbQxVqZsERj6YIejzl29wad9VM+LlegwZENNoI5ks=;
        b=BQZtSJwUnbjSdQFXb+1hZrWw2bHE3xtxdiVPNmqkxEUrjdBovh7WwN9+aPtOiS6SJF
         73lnitKhvRVa8cUwn/nEPjCMH/yhUu3JbIfC4ZHHKVjwLw3U3to435KvK/DboYBS3SN/
         T+SD2RrtzyAnUiuA7Z9A0Zxxh9vo+NS/acpY6+B98PNMM4W3NtZVkV3U68zTiRVwTgza
         LeRH4YE2kFw0Fp4pnjWQBZzJ+Lbo6RoyorsRmm3gGvYCdFPelly4F7JKk5tzNZC+pzfW
         n2xfnA1L50+B9RpEm+/mJanq/Z45JCk9k+535o/DydCsfgHtUv4SoEN1G5lV42bRJxHU
         lc9g==
X-Gm-Message-State: AOJu0YxliyutKBJ1xcDc5YoXuEs47jTo3HqDDlvOHb2Rn/2XJRmNw4e7
	00+8ldc75xRNY+RFtDbflIKDHAkCpWDkN1348rV3MLuXx/iiOBwvKul92pNvVtByFGy3YnoO4gx
	8CdghTWtfatg4KGnnEVJJMs7pggzsivfe773D2w==
X-Gm-Gg: ASbGncsvZCSWZ3IdfnrnVuXDlYvJw6CSNv6WO28amNLL0KQv1mwrJw2pkpE7nCsj6wz
	Rc59fgLsjAaCxcnGDcxWwb5u77dnhoj72FO25QTjh/s7YY4SYbdy0XPlE+BnHQTCV4d/wUtagJe
	NlIFwWZMCylYK7wO3QjIdtuevvCWbP4TM=
X-Google-Smtp-Source: AGHT+IFzrnJJnn3asVm/tHppycMioZ61uytxdPeqw7tVnNEK5Hgu/5X74yE4ReIFnOXRZCTl5kwQNPBZ69nz7KgPpGw=
X-Received: by 2002:a05:622a:90f:b0:476:90ea:8ee4 with SMTP id
 d75a77b69052e-49495cdb6f5mr117127071cf.32.1747300120911; Thu, 15 May 2025
 02:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514213243.3685364-1-rdunlap@infradead.org>
In-Reply-To: <20250514213243.3685364-1-rdunlap@infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 May 2025 11:08:30 +0200
X-Gm-Features: AX0GCFvZSK9EPpEWzKHTuKpuK5ftqDaFys39fkZuh9wQGIlM8WOvFN1IBVc-VTQ
Message-ID: <CAJfpegv9k5tPwq66yRvA6EdFaxHUqGsxYCfxnAKg8HjwpTi_gw@mail.gmail.com>
Subject: Re: [PATCH] fuse: dev: avoid a build warning when PROC_FS is not set
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, 
	linux-fsdevel@vger.kernel.org, Chen Linxuan <chenlinxuan@uniontech.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 23:32, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix a build warning when CONFIG_PROC_FS is not set by surrounding the
> function with #ifdef CONFIG_PROC_FS.
>
> fs/fuse/dev.c:2620:13: warning: 'fuse_dev_show_fdinfo' defined but not used [-Wunused-function]
>  2620 | static void fuse_dev_show_fdinfo(struct seq_file *seq, struct file *file)
>
> Fixes: 514d9210bf45 ("fs: fuse: add dev id to /dev/fuse fdinfo")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Folded, thanks.

Miklos
