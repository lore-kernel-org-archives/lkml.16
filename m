Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B58253940
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748153; cv=none; b=VsT2N7b6CcnNCf+tDHPOB2R5RLYFV/5sYjiixdGHEdEf36G88X0B1XmiOvc+wRt3FKOeirnLVgbQrpe9P23wH5dwxW7OU1zVOAfh07ns8xO2nLoqUB1WeO9TRekHYli9usY5hmf6k8O9Tr1OlT5Otre7uzlcxxybSJuUfHaxSB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748153; c=relaxed/simple;
	bh=8WM1JkoLUxcVQ1aEB+/iZlVvhjVi2Nc58ygow9AMiNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ic4vFX3E9oe+hTK5/4/C0okVgIR2qNG6UM0CpFGOFk4esgvPBL1NhmPsf/+XcVm0z0MWCY3Xn2VzqD2EpD95BCuxLXHPEw+sVfSmE0TswB44ctqFlnpAEx72Y6R4oAwvFhrzRj0HngszCuFxIwDUbCXkkiOV8HlReatewGkIOMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bc8e1jVl; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bc8e1jVl"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef9b8b4f13so53680667b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744748150; x=1745352950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuI60MEO0RHxwbmndWEztZeXe9SV7ztYqn+5hRpJvc8=;
        b=bc8e1jVl9lba6PqEijk6yW5d1IMJscH41imyLJet+dsNpfq8n0UraBD2v2ErCrNDe/
         5AYKkEF44JjwpOHBVvwlDpapN2//oCbuvZnIXYcZSQdgmv+3TB4kFF3yLk5eWPeozbRD
         pAf+LdOkfyH79JP/FRNvCGH+g0WWQsZKYvdl/QZc/DHvqolKoYE4dpRi2wZSDUU5u7Sb
         tQsjA4kD9WpPtTnTN7mME15F3E86zwnIM7WAum0cKNRtwdvAwfVrZ2c0mf9gqA4eyhmY
         YJB9amgWAj2w69yr1FkJ23ddOz7zJUvIu49/N2oH7+q/tU1t0pMoIJ5ygUH53hylDKF4
         Hefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744748150; x=1745352950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuI60MEO0RHxwbmndWEztZeXe9SV7ztYqn+5hRpJvc8=;
        b=bcT4E9jSNdauNpdM8XVeCNefs8olPQE2tANiu2kup68hIBHTzIG/P8fWV+aoswxMuY
         1qhVLSm4AbqiJcJOaKpcnHVWyVKxeIPHG6Cd5+e2QA6zfiIfbKLAwof6h5PsGKgG7NTn
         LSS14/EdGXeer2pEM37IhTIzdYaCxJKNHdGk+2Z3oAY7wuD7qqI07MssyF+cerNZXkwm
         PeDT1C+zAV6wjERwgL+mxHGy+3dKsLlXDIjak8orGO3gab6FuMyf5dNbbBhZVus42HEI
         MZ0g3TvLNFlmjiP9NcxX4r6F6m5N3TCgncHa+sdT/vrwZhZnnFjLra40rtIbey5T4LDv
         XSyA==
X-Forwarded-Encrypted: i=1; AJvYcCU1AKgqj03e1pSVdribi/X56vgvWqlnUKH6w5y8s+R1v/MyiGMMb5Yd0rie2sUtFktFUI5DgKxYTudorDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUqO73plNu9FTN/29p0a4qgCpqVk2aiCKM9GrkfnogtLqH26u
	HMtXagoFBVjs0ViV754qlY9wsTYzG/pby//B29vnZrWLs1BhEf8F/vnajM1+9MBBJtyKPVOeka+
	V2rH3JckBbBgxlKfo8WOostcshiw=
X-Gm-Gg: ASbGncurj5slK1emf0Uu96OZRujY29lK1nVaubv8EYyfS0mIGFBw4dA1Thbe1oLSUtD
	OyYLWSLmyR04bsELHy/m3E6gk+k9OQ576HwmGktTJVerU0TDQCUDFuN1UE4IvOD6kNfhyj0CFgz
	KifmrRCoT3oZwaf34aCJdi
X-Google-Smtp-Source: AGHT+IE76oJwMupqx5P+4+nsCpN0Rf38R9V2tja8XN9qhSobyPEx1h6yavJRqYltdgAXIrNpHLFenkcJYLNoUsf7KMQ=
X-Received: by 2002:a05:690c:6e09:b0:703:b278:db2d with SMTP id
 00721157ae682-706aceb9c37mr12720987b3.12.1744748150648; Tue, 15 Apr 2025
 13:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-22-jim.cromie@gmail.com> <948a48a8-10c4-4440-b905-a1db669a31ba@bootlin.com>
In-Reply-To: <948a48a8-10c4-4440-b905-a1db669a31ba@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 14:15:24 -0600
X-Gm-Features: ATxdqUFuT29QvT9OQ8Dzq1ooQJWL8v5JATc8uBnNix4CnQIMzi9vLxbfc1eDONM
Message-ID: <CAJfuBxx4kNb6ikVSAOX8bgnaALq8M1qp5UUdfXXey4yqvaU3Gw@mail.gmail.com>
Subject: Re: [PATCH v3 21/54] dyndbg-test: change do_prints testpoint to
 accept a loopct
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
	tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
	ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:04=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints
> >
> > This allows its use as a scriptable load generator, to generate
> > dynamic-prefix-emits for flag combinations vs undecorated messages.
> > This will make it easy to assess the cost of the prefixing.
> >
> > Reading the ./do_prints node also prints messages (once) to the-log.
> >
> > NB: the count is clamped to 10000, chosen to be notice able, but not
> > annoying, and not enough to accidentally flood the logs.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> I think this could be in a separate series / merged independently to
> reduce the size of this series.

I have no strong opinions here.
I included it to acknowledge that this patchset is mainly for performance,
ie to replace LOTS of bit-tests, (some of which are tested at framerate).
So it follows that I should be able to demonstrate the savings somehow.

I havent done so yet, I was hoping that the benefits are obvious
enough not require proof.




>
> > ---
> >   lib/test_dynamic_debug.c | 37 ++++++++++++++++++++++++++-----------
> >   1 file changed, 26 insertions(+), 11 deletions(-)
> >
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 9f9e3fddd7e6..4a3d2612ef60 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -29,18 +29,30 @@
> >
> >   #include <linux/module.h>
> >
> > -/* re-gen output by reading or writing sysfs node: do_prints */
> > -
> > -static void do_prints(void); /* device under test */
> > +/* re-trigger debug output by reading or writing sysfs node: do_prints=
 */
> > +#define PRINT_CLAMP 10000
> > +static void do_prints(unsigned int); /* device under test */
> >   static int param_set_do_prints(const char *instr, const struct kernel=
_param *kp)
> >   {
> > -     do_prints();
> > +     int rc;
> > +     unsigned int ct;
> > +
> > +     rc =3D kstrtouint(instr, 0, &ct);
> > +     if (rc) {
> > +             pr_err("expecting numeric input, using 1 instead\n");
> > +             ct =3D 1;
> > +     }
> > +     if (ct > PRINT_CLAMP) {
> > +             ct =3D PRINT_CLAMP;
> > +             pr_info("clamping print-count to %d\n", ct);
> > +     }
> > +     do_prints(ct);
> >       return 0;
> >   }
> >   static int param_get_do_prints(char *buffer, const struct kernel_para=
m *kp)
> >   {
> > -     do_prints();
> > -     return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
> > +     do_prints(1);
> > +     return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
> >   }
> >   static const struct kernel_param_ops param_ops_do_prints =3D {
> >       .set =3D param_set_do_prints,
> > @@ -191,17 +203,20 @@ static void do_levels(void)
> >       prdbg(V7);
> >   }
> >
> > -static void do_prints(void)
> > +static void do_prints(unsigned int ct)
> >   {
> > -     pr_debug("do_prints:\n");
> > -     do_cats();
> > -     do_levels();
> > +     /* maybe clamp this */
> > +     pr_debug("do-prints %d times:\n", ct);
> > +     for (; ct; ct--) {
> > +             do_cats();
> > +             do_levels();
> > +     }
> >   }
> >
> >   static int __init test_dynamic_debug_init(void)
> >   {
> >       pr_debug("init start\n");
> > -     do_prints();
> > +     do_prints(1);
> >       pr_debug("init done\n");
> >       return 0;
> >   }
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
