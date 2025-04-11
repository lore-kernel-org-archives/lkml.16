Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA776215162
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744333165; cv=none; b=p/HmvXq+2QgPTdIDijw7broEAfmVZxSRORGKFs2yyk4btSdxcAcPTPxOmmxidZcH1Tjkm/scsVvbWyjs6P+rYRSnTVrkqhC+seZAbVhHHkxXyhjvY5Xc0PUntY1ihamijD9qoUd9bPswajI0TgVZe4j8WUAZm4nJ/UydfnLQ/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744333165; c=relaxed/simple;
	bh=7/X/OjZ0mxqBLekBTQhd+ZtF6qj4/Sr2ij7M0murOcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzzE4E5pbd6SOrFW7JzvG1z1p/0eprNvPQPy5Bhq4gqfyRHYQhC7buwIYlOHer/hGVxJeusMOziEmWl9I4h6XENn1cD2GR9hcZRaoZwsgMTBKWICmaObDNgZZ79orRor2QsAD8jLNTxc5JjuUYMuq/i7tOjl7NXobObQ8PKMIMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAG0rzGA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAG0rzGA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso254333066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744333162; x=1744937962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/X/OjZ0mxqBLekBTQhd+ZtF6qj4/Sr2ij7M0murOcs=;
        b=CAG0rzGABbkfCuEww3CboXY00Fj+vtwkQu5LoUJO20O+sVtho1cwOSRLo56j3rA10a
         XF3wSzule2M5NVfC03nS5RbsEpJV9BarcPJ9lI2V/xYjoEDrZYKs7iFZj5esUbTAGcT3
         dzOKeqE9M+irBkKYMRGDiSZunFsGJdVzDD0oyJT260fqPr3GrseBUHyhmMoFkc8PtCmi
         GA5eac19yW6oHju43hyEOY7N1WVsf82PcpqehVtyZDGRvgAoSmM0Ol7KcrTsubwtsJTh
         Fm4fnFtfFY+www49ld+iMF7Zdy0XLxwamix/Y4MCL2IUCHsUla4m5AC+is8Qppe7NCAl
         BM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744333162; x=1744937962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/X/OjZ0mxqBLekBTQhd+ZtF6qj4/Sr2ij7M0murOcs=;
        b=VUEkMUiqjEVYH84x1YKNy3nDOF4LjP/4eZFR/tUGea4vMnjdqo3o0sNab+ogjUBXv4
         TqgZXieWfKVse3bKH9W4O1Yb4Vy4L8FhJFs/SaZ2STs49EAUzivHp0uc3z/kMVOzuhxZ
         wxWCCbCCnYHYQ4m4qudNZ8dLC9VhjLC/Tnt/ZzZZLeDbzXd+oant1rKp73QyItxV+wUZ
         1AkDhmqEvBM5S8RJ8p7zXzHohiAEkJOdylMjABuegEtWJnzOUTAzCt6gBa/rcWzoInrV
         KQfSO7aeOdHjhUYwtwDweisIhuNqU3AzsMsDZWb5RK+9swt+TIHZyJOQDVxu4AfsN3Z1
         HFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2533yXSeN142RQIp/iWVwtR/o3ISaCKcVvVfiepxCfY7WftEdeutM5ZK/g7DXyOdXkKQCFdTJEF4iPTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH3WJpt1aAGWtowOkZnKppT75sDaXiXM6tRN5UnIY1DYxbDiKi
	21ToPabo7i7sc3BD2H+0DyM5pqlkzm5OvgA9nwDOOiXHbMWZ7G4066wZg1MgD7tMcvOOuONvW54
	KilVe6YhAturf5UmFdD9vA1lyHFk=
X-Gm-Gg: ASbGncvdpmOscUTwbg/DhrB5enoSJcBK2EGOgCFXS97yCTPirgfBcxdX46JLNoleFcM
	6RGV8e7j7hIwIyzq4TO1RR8pXZPhg3kd6DD/wCwXlwczccC+kIHH8I3IJMOqH+veO0rHjN8IWT+
	l0KzHg+tOdH1sTKIh0qzttCw==
X-Google-Smtp-Source: AGHT+IHhgJlmWhbDsMSfsq/EH+8MG5k1rsaV8IYABH+gaFKEANF3sqtxFuu/eJmlSwKih+jKyEmS9X9X9JHXgxqMim4=
X-Received: by 2002:a17:907:3e1e:b0:ac7:3918:752e with SMTP id
 a640c23a62f3a-acad36d93dcmr52285366b.59.1744333161527; Thu, 10 Apr 2025
 17:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410092423.9831-1-alexs@kernel.org> <20250410092423.9831-2-alexs@kernel.org>
 <Z_fFlstqFYGPFLEB@localhost.localdomain>
In-Reply-To: <Z_fFlstqFYGPFLEB@localhost.localdomain>
From: Alex Shi <seakeel@gmail.com>
Date: Fri, 11 Apr 2025 08:58:45 +0800
X-Gm-Features: ATxdqUE2cTfd_JwmeUe0iqGRjmByKgnvk7uDY_btHJ75ZMUV4hBGkgWPLJx62-E
Message-ID: <CAJy-Am=oORjnBx09phsBCkNxF+bK_CyWA_eBMHUG0WdE9pb63A@mail.gmail.com>
Subject: Re: [PATCH 2/4] sched/isolation: clean up housekeeping_cpu
To: Frederic Weisbecker <frederic@kernel.org>
Cc: alexs@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Frederic Weisbecker <frederic@kernel.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=881=
0=E6=97=A5=E5=91=A8=E5=9B=9B 21:20=E5=86=99=E9=81=93=EF=BC=9A
>
> Le Thu, Apr 10, 2025 at 05:24:17PM +0800, alexs@kernel.org a =C3=A9crit :
> > From: Alex Shi <alexs@kernel.org>
> >
> > housekeeping_test_cpu will check 'housekeeping_overridden' again in
> > itself so we don't need do it again outside. just call
> > housekeeping_test_cpu is fine.
>
> The point is to do it in the headers, so there is no function
> call in the off case.

Thanks for comments, Frederic,
But the function is 'inline', and further more, the
CONFIG_CPU_ISOLATION is in defconfig
and most of puplar popular Linux vendor. So it still be compiled.

Thanks
