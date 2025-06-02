Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B60324BD1A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901115; cv=none; b=dk3r+O9PuJVFp/ZpKG+Dulsrbq+D1BqASWfhurRcyH70nOEn3DQYsh4BkDO02uD5YxIizSzirkuOC1eOdcZrusA/cyUz5+vO5Y+XyQDjG3U9OLuzzXje5DwD3FAH8d2k1mnF9OnXiQTfxdVAu1aQVjhj03TSyTAnili2a4oUUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901115; c=relaxed/simple;
	bh=XE+uKvuWjdGPReHa+Kg+yAXhMCxyxJtDYEscw7wyFhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVA34tpUL1Iv52+6PqDGICICUN80HQL1+J4uWHAb/+TMlUXRMn3LbXWPajYTeQzM2iezhweVjXrELdEHKGEpsRiNE511kuuuHMOf2BZjREJyQZYAYkEOI1x36WQr0hGJrKyPtlXa6/5IAAiIJH/2pKaCMGu75i8HV9+nJBhYV7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGBE5Ggl; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGBE5Ggl"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7382ffcb373so1175782a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 14:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748901113; x=1749505913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VTx1z0/jLBEHiZj+gQmntz7XkqKdJtW2AX9oINuRYk=;
        b=VGBE5GglLY0egC2PTaWIckNfDRAd4ZL2EaaD1R4vJ3XgcFd9ckgigQQeaSWyjVr3f4
         CNknn7KrGDZ+Ueao0Sftyzq2QkAnlqpSvEWvZ5qJ82mYKnWtUxA0/1yUM6obYGQTAltg
         SutrZ40VHHuAkoc8gVyTDgaVdM8qFteaKvGw3yxZgirAaYDAPIdXqmiivsbGwGx03YXM
         jfu0lWTeUBSCoXuK7iJaEK5qcrkXc+qq3T1Xpt7HNtasSyKo2/m2mFtCFFDZsNVYgWDR
         +pstq+ccoYuGeXWO9RVMVJoErRs46iADrGn0xtppjE/9GCfyv5ecwEoZhrdMdAaezghL
         qQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748901113; x=1749505913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VTx1z0/jLBEHiZj+gQmntz7XkqKdJtW2AX9oINuRYk=;
        b=EasXqz8ly/QdnKOuzuFGQDiEnL1qlOO+L4abnDH3AwNGJKosJWwvofjWstNUvHui2z
         XPdihTa35Zm8bSTboleA6D5LgZQpnM8cv/1v3utYsuAvZYQuHoPyzt/8WGJBOHw1BB0f
         +4c/WT3uOY1uj9GCPOCMPKyuHQXryl0vlHhtmLXudeo7UE0jOoGYrK3zU2JsVSKGq4so
         zX1u12VnxARlLOlDGETj3+Vy1Pbn5zwX49+NWK8g6tAByAlN52CO3YLPTZZ03N/LnVoF
         lvbQySRQVxr/eepSv1/ZVJUursnOGJVm5OQ7c3VEyQnhJIVfsoF3U8xWrm6IAs/S3+Eh
         KyMA==
X-Gm-Message-State: AOJu0YxUGaGZVBHDrH9GHezO/zCS38MJjHRXfQhA00RPr98GeAHM3Bt8
	vSREM+UJeQTqkL5WX+06S2gIMvqFt8ngWcrTZ3cz0/+/R2xKjzFoTJlWwtObNXzP7ojZmZUfo/+
	F/jWMcI5WeK8a4QBOWMVz88PeCLfW2As=
X-Gm-Gg: ASbGncuyt+kqgZ9cvES1vkclIEKj7/kdjOaGd/QkfFVjhVHiULnsBjVWuyk2F81EaKu
	P/PgKzE8BJPDzxAf0s5NN+FiUUcWeB92cxVDVpITo0unQJ1IrQBPzTpCQexDvlPXCC/pbs2uCT0
	ofxIw6pMhEhTn6qheCPXDyl2HK6aOHaJFwtg==
X-Google-Smtp-Source: AGHT+IHmi2NetFTv8t2KDL1fujnjEBP6Sz7JS+HOWeddJFsMV+AGpShVlKja8tJHWyP4ZrUlVudYHv+ymMauT+eDNsU=
X-Received: by 2002:a05:6870:701f:b0:2a3:832e:5492 with SMTP id
 586e51a60fabf-2e921565ef6mr8026532fac.25.1748901113155; Mon, 02 Jun 2025
 14:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDlskzKIAULMlwPj@gondor.apana.org.au>
In-Reply-To: <aDlskzKIAULMlwPj@gondor.apana.org.au>
From: Andrei Vagin <avagin@gmail.com>
Date: Mon, 2 Jun 2025 14:51:41 -0700
X-Gm-Features: AX0GCFudKjyUPLOY8zW4gpYze4Qc2rn5-d480mXQEPMVsB7ghp6_CAys78NyEsE
Message-ID: <CANaxB-xUyhtGq500ToxXLMJhD_-UC9rKFX0_3CezxNyhSJ=ouw@mail.gmail.com>
Subject: Re: [PATCH] time_namespace.h: Add struct seq_file forward declaration
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Dmitry Safonov <dima@arista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 1:30=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> Add forward declaration of struct seq_file before using it in
> function prototype.
>
> Fixes: 04a8682a71be ("fs/proc: Introduce /proc/pid/timens_offsets")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: Andrei Vagin <avagin@gmail.com>

>
> diff --git a/include/linux/time_namespace.h b/include/linux/time_namespac=
e.h
> index 0b8b32bf0655..bb2c52f4fc94 100644
> --- a/include/linux/time_namespace.h
> +++ b/include/linux/time_namespace.h
> @@ -12,6 +12,7 @@
>  struct user_namespace;
>  extern struct user_namespace init_user_ns;
>
> +struct seq_file;
>  struct vm_area_struct;
>
>  struct timens_offsets {
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>
