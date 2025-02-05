Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B220C026
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785638; cv=none; b=YVEmKNQH7WbmKgau0B5I1ira4dWnRZze3CBrdWejXL3uY/fNK0fdXYaJJ8rhTqGeUOsLhKK31YiWH9Mgo9pIAqjnZE0ED7ZKfmOVJ3SeDTjLwpNfDDsAbT7S3Qa8kKTglAJrjaFWNmesjt8nMndzzvF7SpCPOvE6ufgJ4VO/p/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785638; c=relaxed/simple;
	bh=dO63lO/FYn3hFlv/uZw05d7NpedFIALqWZ207EiRRwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smCwndWVxfxm3ZkKBoG7fj4jIhIadXBid6qd6eQVLcmn78f7vL2BtMVpWFqzESsTnHusffmeAu9kR+e9hnAmBTBOoArZ/sWRWX4lK+v5BqqpsndK6+/vrfLcbEYaK+uOpBNrPjjkTSXDD3a8o5d/isutWulGsaRQbqgVgoZq+6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYsXdwUn; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYsXdwUn"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dc82e38c10so400495a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738785635; x=1739390435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO63lO/FYn3hFlv/uZw05d7NpedFIALqWZ207EiRRwE=;
        b=eYsXdwUn1Pq/KlU8fomaAareuxVI9eWVgEw6HrgjuxQhF0djhkGFYWjFXWRuBopPk7
         UETUbT6mWFIfgDb5HR1yXBzoNeK0yOr039Wo+IFEbvtkHXFd2JOd1PtEfG4j/EOpZM20
         4TpeaFNAIQkFUmDAnkh3hXBuGnCm/7bnvZl2l2yKgC/EZ6n/eMo3yluxno3rXgIgvLa8
         lp12SNtEZahG/gfU2xnkVGZjRB3noYzYM/0vIbcIs5ivygTKboj9iiLc4wUO3VncWf7c
         YbboC1H06hI0qxrOr0gnUwKbyR+2gjFui2hP4jZjY0TDd+cvNx5hMzdouQymgVTJPYRV
         BNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785635; x=1739390435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dO63lO/FYn3hFlv/uZw05d7NpedFIALqWZ207EiRRwE=;
        b=HXKMi+HVaWRFkwGV5JoAG7YeAgFWve3PxX35Kxug55UtlmNAiB976gCWKr+A6cfYyy
         HvfUPFbh+9cWrXfLUhYsV9m4msBY46XUxiTtH0YrHfH8/A2n3cJdXKLWFWTJ9B7s4hmU
         i4TBwcmpHkPGNdm2os8iOKjdjmj6GeIU9bGb4Q6D9bgoE+SStQiD4GEk+zEBwAizzeOz
         ogWhPQbeSZBy98L5MLadpS2YyrvT4nK63AZLijzJPHty9nCpSW30GvfxZRsotYYSOv78
         VxAILj/1zFfpXYsod0J8RAp8PW6wTQmbJpqYIn57iYd0FI9IJOM4j27uBQLX0xA+MI4e
         srWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeiwaKTSem/cjn70RqftADeSCWdk6JxcjBB28jvt1fkLKpFxS8p/38yC8fvwna/RrcMHjHyMgQaRZs3RM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7JoHJVNRx+9XHEjufWDEeYRLnFFlzwpJ7ycAxPtf4N43ixmP0
	SMxKCGm02XZXqkEP0MDZmH7aHv0MLqP6ox7YxCK6Lw8UxTCl2lnL1WUwpS8eSpnXEmQqvrK7xmx
	4RYg8FFDUaFTbC+MTjwiYR36em8w=
X-Gm-Gg: ASbGncvtTcnK4ceOyscuc+0S+obE+wEIblWdB8+T1CJcJKzvDKLcPTPFH2XN5wQTRon
	ZrfU8W685HPvI+NSFD+LHc3OPnUrV+O6OvzQonrkSPq3lBSxCEX/FJQtmecl8/XS5/0o9wTo=
X-Google-Smtp-Source: AGHT+IHtXA6Lf7Vkk8kyo+q83hau+OXhPd6v3x7YPBsGMFKLUFLqVHqYou/kGdhawIMJyuKZkjh+5ew9JD8i8T/vPdI=
X-Received: by 2002:a05:6402:380b:b0:5db:7316:6309 with SMTP id
 4fb4d7f45d1cf-5dcdb700231mr4669199a12.7.1738785634972; Wed, 05 Feb 2025
 12:00:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205193221.402150-1-mjguzik@gmail.com> <20250205193221.402150-2-mjguzik@gmail.com>
 <20250205195555.GB8754@redhat.com>
In-Reply-To: <20250205195555.GB8754@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 5 Feb 2025 21:00:14 +0100
X-Gm-Features: AWEUYZlJFA0k-iZw8OqCbydbvEIUo6s7RSJdDUCKP29JjIBORpTQaeaJnpTeYl0
Message-ID: <CAGudoHFgXotUX_cmkSpdqd4xLxvKrz6x2gLUONKEKsCWd3LUHw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] exit: perform add_device_randomness() without tasklist_lock
To: Oleg Nesterov <oleg@redhat.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org, 
	Liam.Howlett@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 8:56=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> On 02/05, Mateusz Guzik wrote:
> >
> > diff --git a/scripts/selinux/genheaders/genheaders b/scripts/selinux/ge=
nheaders/genheaders
> > deleted file mode 100755
> > index 3fc32a664a7930b12a38d02449aec78d49690dfe..00000000000000000000000=
00000000000000000
> > GIT binary patch
> > literal 0
> > HcmV?d00001
> >
> > literal 90112
> > zcmeI54VYWidFQXqM}!HsAV3BA;1X~VGz`MnRD8IRv5n=3D#7zLYDVcSUZjK)$tBMC`k
> ...
>
> Hmm? ;)
>

argh.

there was a temporary window where this file was creeping in, i forgot
about it. i'll resend. :/


--=20
Mateusz Guzik <mjguzik gmail.com>
