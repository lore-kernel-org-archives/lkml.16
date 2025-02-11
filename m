Received: from e2i673.smtp2go.com (e2i673.smtp2go.com [103.2.142.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3A1EB186
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259319; cv=none; b=UW+3hYmVmagtVlWQZoKjXCC0foObXcjXRvWpVV3Kev278/+s4GGcBTreqsUGbqUKX1qfrTMTiCqYuV0Xc86/r4woV8slVpPAgvPUHdZNatK+pZsz6Jih71YXtUVmcNIZj7CjBBjKk1w/QTenZAGyPmc11nk+Sjxm7Vae/HD9tPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259319; c=relaxed/simple;
	bh=QWC9deTNsC1GcDXhXNZCOENwee7u715bsmzbXt2Hfqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbqAFDqokT7rkG0VInjZeGwDyBlMVz8tWCC+pn8iqPIN2UZPU2g390e5d37Dwzt219xTle8Mrsk4PswugGgwG5BERg05YIO2fDD0EBejdRvnRJYbhNGH+rftUUbZ8H7Q2iCsiVOunaiApVE9ddyCSh/3XK/1zTVr34zk4i+HEDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=HGiHbC3f reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=CGJ/9fvv; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=VlRO2wcA; arc=none smtp.client-ip=103.2.142.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="HGiHbC3f";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="CGJ/9fvv";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="VlRO2wcA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1739260210; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=OWjrhNaZdQZFGwxKdiBQQCI7wGCOzVV0Oh7tcBp8qG0=; b=HGiHbC3ftR2ffXk71+JOAXZeJx
	zzVmuH2uw94y2CNRCR6nrEQ1bnWtxqOyyZ/PE3ntfUfcMqj9SByvVuxOEyAThK4+Lp1jks9BMoTZq
	MScQSAXaUx79VyRgwGEs584tk9ij6vMus4RQRpnX6ouAPC631si+pcxBRBoX8CL/6Oi8wWTtl2ik9
	NFBVSMSMGQghlubUIP7FO8bg18PYu/dle7yEvceXdZQrrYAQpesfTm9UO2UpHgSzjDIbHXBYIDKev
	FGX9/sdadde77gh2oX2tiQsUHioVOj19/ydvNFy3XqAwpgL89eKSwK2aVALGrAWzI9yaxJPI0eQSo
	veFm1mAw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1739259310; h=from : subject :
 to : message-id : date;
 bh=OWjrhNaZdQZFGwxKdiBQQCI7wGCOzVV0Oh7tcBp8qG0=;
 b=CGJ/9fvvOK0xC3IlnrQ4Ly0iqGLaGz/QLQYsQu8mTrUbtj/rwHTU6LXuBPGLhhFCwkxWW
 BKrRp3Nkazef0XQG8AshFsh5ooxVoZP89iBeG8OOlmyIvTWbWw6j+fJXfih7gYRY5CmxpNk
 NHdaOtH88XWQ2Qm3m79SleeeTMBHlU/v56B3+SXUksdzhE6cb9Wt2BX97Mh++eSphHf22dm
 EkyJmy5G2Af8lYBXXQ+0AuJWVOeUap7j2dQTNJf5lJYlYz1gwRe1+aYy5x9VRi48yHEpcrP
 T3W/6QoXAHppNYv2Ss+e/ax+G1Bc9EtXvZLZlrV2dgQYiXBEf4V5E3lzXC5A==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1thkms-qt4IZt-JO; Tue, 11 Feb 2025 07:34:30 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1thkmr-FnQW0hPoGyp-mM8o; Tue, 11 Feb 2025 07:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1739259268; bh=QWC9deTNsC1GcDXhXNZCOENwee7u715bsmzbXt2Hfqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VlRO2wcAX+e9SaIF3Z1vX6aOv5XRh24Yg7SutsGe6s3Pspf0Jl/hzcKHphsnrpm8l
 Y45vTxY4vX6cy1hpmnzfjKne/W7Xe/Zyx4+o7inTRCwMvdCB02uZjxrOTAzp0IKOdI
 asX6SMdzYJmQZkzUuFFJobysOGP1T1jNeQcqnBgI=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 0F4D4495A6; Tue, 11 Feb 2025 08:34:28 +0100 (CET)
Date: Tue, 11 Feb 2025 08:34:27 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] modpost: use strstarts() to clean up parse_source_files()
Message-ID: <Z6r9g9cYk_mWsRBo@fjasle.eu>
References: <20250207175104.412158-1-masahiroy@kernel.org>
 <Z6cmGqMMLHrWddU6@bergen>
 <CAK7LNAR9f=u3tFQE_xczxOHv5FzJRdAxi81-TJ95BNxEsO9Lbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAR9f=u3tFQE_xczxOHv5FzJRdAxi81-TJ95BNxEsO9Lbw@mail.gmail.com>
X-Smtpcorp-Track: 6mZeNHS0HzRj.wVHXvuo-80CF.ZOE6MwqR6JY
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286snGC8PquRF
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Tue, Feb 11, 2025 at 09:43:05AM +0900 Masahiro Yamada wrote:
> On Sat, Feb 8, 2025 at 6:38 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > On Sat 08 Feb 2025 02:50:55 GMT, Masahiro Yamada wrote:
> > > No functional changes are intended.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/mod/sumversion.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> > > index e79fc40d852f..3dd28b4d0099 100644
> > > --- a/scripts/mod/sumversion.c
> > > +++ b/scripts/mod/sumversion.c
> > > @@ -330,7 +330,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
> > >                       line++;
> > >               p = line;
> > >
> > > -             if (strncmp(line, "source_", sizeof("source_")-1) == 0) {
> > > +             if (strstarts(line, "source_")) {
> > >                       p = strrchr(line, ' ');
> > >                       if (!p) {
> > >                               warn("malformed line: %s\n", line);
> > > @@ -344,7 +344,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
> > >                       }
> > >                       continue;
> > >               }
> > > -             if (strncmp(line, "deps_", sizeof("deps_")-1) == 0) {
> > > +             if (strstarts(line, "deps_")) {
> > >                       check_files = 1;
> > >                       continue;
> > >               }
> > > --
> > > 2.43.0
> > >
> >
> > Thanks, looks good to me.
> >
> > Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> >
> > Do you also want to replace the last strncmp() in
> > scripts/mod/modpost.c?
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index e18ae7dc8140..31468923cdf6 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -670,7 +670,7 @@ static char *get_next_modinfo(struct elf_info *info, const char *tag,
> >         }
> >
> >         for (p = modinfo; p; p = next_string(p, &size)) {
> > -               if (strncmp(p, tag, taglen) == 0 && p[taglen] == '=')
> > +               if (strstarts(p, tag) == 0 && p[taglen] == '=')
> >                         return p + taglen + 1;
> >         }
> >         return NULL;
> 
> 
> I believe you meant:
> 
>   if (strstarts(p, tag) && p[taglen] == '=')

ups, yes.

> I do not think there is a strong reason to do so
> because taglen is already calculated a few lines above,
> but the compiler may be clever enough to avoid
> calling strlen() twice. I did not check the compiler output.

yeah,  I was thinking about code (style) consistency, but you're right, it
would not be beneficial.

Kind regards,
Nicolas
