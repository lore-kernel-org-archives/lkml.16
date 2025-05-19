Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8251E9B19
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673210; cv=none; b=UH4QpIGcI/zct4Uxj3CpBV/fdixGbCo9NZoazyrk6907Mbax4w7Lyp9smGzRrWyK5tn2RRjsIV1P201wrKAvX7mO3iLoVniGKLnwV3tLGV7lQKmYbNlnGSKuF8A4+GzU7j6FyvM1yKVTa3Zweg9kX17gr+izcHvBlY5Pyqr+Jag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673210; c=relaxed/simple;
	bh=naRoV6RdAW0WDlMJDJd4FyDXi5w4xdc1MyQ+AVK21E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+x9kYVaM2diFmNbhTW6xCCnv2bohFu1TilabDR2jWksA11icKcZ3gouzUPb+CzffRC12KkiQa1KVqJgBPvvrnRH3WChFsMb6/wXCzcxXUp6TFqcgXxGmroZ3LmzxRH8UclSAMIhIZk4VXuohXLNvUix/DdKCjsNdKWkVfktyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trJfbwYe; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trJfbwYe"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-48b7747f881so673381cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747673207; x=1748278007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2sT/1C4LzIvjrU4kpJLdVxvc3GAroAF9Ww/fVlyvGc=;
        b=trJfbwYe4cUA+lt6TxwQxVbjkf6owL9dZlr4P5T2+IOw580Il18NkIYHuAHctop/Mr
         d6DZAUrA9zhNuTPKahjxWKoHYOicxxI3BTHNG9IhPljP/6U7DNIJuIAuPMWrvpqKeKoa
         H2ytRmjhk1kCBL5aVyyC5LjGoBtzV24BSFwMVks9K5KhDl07C7XtFyXyRchudo1Lwudc
         ey3ngZGB3SKLLJ7ur3irM6BlxgLAtsDMvpjPXxgDcn6251BjeiAO84UT/MI+yQdFiKem
         3iLOU9R4VQf+wlGFizZHptFWBcw9rwEByTIevQMrX+70Qxuhh3DaU+z4MXRHYZG9r6aS
         JXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673207; x=1748278007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2sT/1C4LzIvjrU4kpJLdVxvc3GAroAF9Ww/fVlyvGc=;
        b=fwYMACaWo3XB+t6hoD1fczOMjqiY+Ww18z/0eCVmGzYxRnMQbwAxOFffHTYsCHP10J
         womt6iRtuOjcBqYkVyzfnX0zhmsCwFigU1yNLb/m++oYAQWpK3gqeeOZv0vI6Z/29WV1
         ZZr/EUIRq6qwkPTHnMi/e84xrIeOVpGsPfOptB0uydRGKRjes7cv35x6gXJ3LKfEbwSU
         abnI/kJoD6LeyXbgKT8VIMHM9iJxNcNQ/PwFgF5zDsBmd9s4a8OgpcxdaEILc4/Dn70t
         tzvXhKrFjWokiwTIGckdarDYc8i4nKvEpliMCDriCW1TPy+jsPopf5EBHqoWv51/KEcA
         gvOA==
X-Forwarded-Encrypted: i=1; AJvYcCURtBnZGdOHeyLeye3C/7M7op2j+iXpsEW8EJMIne9/DVDZz4oybqpH1yWwPf1wslnF7Pps77BCXwuLeF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKF/EmxHR4k4UNJYTnmG0HF+73bWo1zAgi7BirLLehVjKhO6mZ
	BRA2teN8Ly9YPFvASOUNG7t5H+IrlzrUckXBeysL3SSDUHkRpHB+m2AZYjsgvw48pv1BQA2EsxZ
	eQaBbwoj2+Dhjp+GTeYr7ajsrKTpHaT8S54FeM0TO
X-Gm-Gg: ASbGncudRJ9FggYIj17YrdnzXXqdR52ByNU9sK2WjjuOf10Cld5YeBIuhV2+/3e0YnP
	cDSFAvWdQtTG96LnQX74lLgois7V4bKCSYmDvJiyVU9zyAQb3y42TgQ57e0vKb+Y9H1iZGQGCnU
	eANNUFpDFU4NN5opRV4tjNpJn6//3XGSg=
X-Google-Smtp-Source: AGHT+IEllqPuRjIoIBQcCP8vcRe2OxEU7v/JrbwY2grbpdlccYg9QITOits9peAKwplaJqeN1VxxBJIL3Otwu9hiBMA=
X-Received: by 2002:a05:622a:449:b0:48a:42fa:78fa with SMTP id
 d75a77b69052e-4958cd26812mr7207991cf.2.1747673207244; Mon, 19 May 2025
 09:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518101212.19930-1-00107082@163.com> <20250519163823.7540-1-00107082@163.com>
In-Reply-To: <20250519163823.7540-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 May 2025 09:46:36 -0700
X-Gm-Features: AX0GCFuM-LBmkyaYZE6NraiI057jVt3QT0c0j0QzYqPxooLjJWJGczHAF2PBVO4
Message-ID: <CAJuCfpFzhroY2hm9o0sWF=NUOuyWjUhnnyFLoPYw-sR8MFEptA@mail.gmail.com>
Subject: Re: [PATCH v2] module: release codetag section when module load fails
To: Andrew Morton <akpm@linux-foundation.org>
Cc: petr.pavlu@suse.com, mcgrof@kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Wang <00107082@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 9:38=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
>
> When module load fails after memory for codetag section is ready,
> codetag section memory will not be properly released. This
> causes memory leak, and if next module load happens to get the
> same module address, codetag may pick the uninitialized section
> when manipulating tags during module unload, and leads to
> "unable to handle page fault" BUG.
>
> Closes: https://lore.kernel.org/all/20250516131246.6244-1-00107082@163.co=
m/
> Signed-off-by: David Wang <00107082@163.com>
> Acked-by: Suren Baghdasaryan <surenb@google.com>

Sending to Andrew for adding into the mm tree.

> ---
>  kernel/module/main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index a2859dc3eea6..5c6ab20240a6 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2829,6 +2829,7 @@ static void module_deallocate(struct module *mod, s=
truct load_info *info)
>  {
>         percpu_modfree(mod);
>         module_arch_freeing_init(mod);
> +       codetag_free_module_sections(mod);
>
>         free_mod_mem(mod);
>  }
> --
> 2.39.2
>
