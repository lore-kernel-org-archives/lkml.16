Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F327F753
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747418953; cv=none; b=jpr7dmFbsKY72FP2f1ehMC8wuyWXfa0omzuWOdPcZ/6KOpb652Vuj+7E7kVehy+XFqCIgebUcttBmX0b5k7eOu8fvryGKlWL5pMEoTwecimKJg+jk0Bx24LhfuMLvIIHGY21oup7D+kBGPu30qksJfK/E2cn/mYhFzAHoJF1RlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747418953; c=relaxed/simple;
	bh=rGS0QPr/09kRB4IST4qU+ikhdOE5cmQdYP0Uuer0Abk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KO2CJD9y/sRxUzukM4rj1N4mbp9Rt9pKoJIoCPMrnLLVcO710qZhGHNyILeL5NxoItZod5Xg8nAVUGFmzdk5H6R9RSLDOM7yKucfByarr2qvmEqMkdx33NZ6LUdlyeOrEfCuYng8fQvxmcs/9RC6uOEkkCxNuNiMxHnZq8F8VBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bXm/WY1J; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bXm/WY1J"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1272a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747418948; x=1748023748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zErr14NaPV4E6J72+UwhYWs0JPsGCP0hDOHvFlHwRfA=;
        b=bXm/WY1JOT4gtYGTIt3Wemb6cMGuhruOyjoJuSZ8gAGqXRn4o3oAuDpLfHM64X4fFJ
         8IfLue66ZXs9w1a4OqlyzhhBeOLQkdn2Bg9a14grsolnAw4h8DlvoRdhlYw3v3AGTOJu
         lSSv219RiTi5Szt4pqPnzfc2MLKjEHMgALrjtjWaOxnLT2DpiUmmUGctlVfgglEzwz2C
         Vd4+KuJqMQfyMmxJQ5+g6Dr3iEf5dosHFuQ9QBxOK2rssw+A1sDVU3DajQE2HVkPnOjI
         BL9hKRVi09QDxSp+aWlA/A4Zva0WjradykWouHH1M8WWmGBZXQdil/Z6AfeSZvwU49ya
         RcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747418948; x=1748023748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zErr14NaPV4E6J72+UwhYWs0JPsGCP0hDOHvFlHwRfA=;
        b=WylOOiP+LpQ1bRHoPW+mZuhuA+FimiMmYcGwuL91dVzmEUvMEPki0gQvty+6EZG2re
         8jFYW6fxKOehXrAasqD1j7EAegrd7rBhEKHo4DNBKnGM9e0uu9aMKnPdMsheFFq+C5ED
         kfyfqABLzhtDcxqw9un0AiWqxKTdBE4MsoppQUVZ2COcakUFuNq1wUkfu2orpqKDPsPt
         CBzSP3uanjzmp4SchYdkzqlRcq5odEIGvdE2rCwB62akh4ZyvcYGBQ6kuOOrouzKmDJ3
         Knr+3LrXDQcLVO3Ki8p4atPh/qeypRXOzw9i2ytNdfsXb/yUta5kzPiJ8/yGbj6Qa/1d
         OXNg==
X-Forwarded-Encrypted: i=1; AJvYcCVW593pon0vxBJU03fl9tsUXnaSQlnXxIcEsmP2tI+lp/L/Fzcv6qgy8rcE1ApiXq8xf7J83YIJ7puvYvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTuNY/MDa7QBGHG6KgPQtnHCE/OsCNzWSmmnSjhdKHi5yH8Sl
	N/rfdtUj5geoPPPaocsdSvHJKqIuxFleJleZBIQmgMH6Og0RZPK2wprx4JbNw3oYP/WUZzL9ESO
	P8fIWrbAa2wuffgIbyxhfmuDlYhiQtCIfNYASuo41
X-Gm-Gg: ASbGncvwCdozAfoHxy8kKpTtoOpuIWPp8Gf2i72ap9mJ6LwEr4byTpYKEvLwDU4qST0
	1z3lBAEOLBLMao9c5b4UVPufQlw6L4ECcwzpQmiaN1pJ3MySq2VKn/XYESgLc7K7YyhCTfiP/Um
	N9OR3ZUQlCSPjqE/jLMz6HjyagvQSDgU6+y8vV/sNghhO62P0fWDso6bad+GAHniH9q1g5s/8=
X-Google-Smtp-Source: AGHT+IGnDa7m9aFXLxTwW8XG/RA9k967U8i6KOIZIfU5U7ERMqkoZyY31cHz6O+XJ+TMiqZHyQoF6udz8LkIEPLR5b4=
X-Received: by 2002:a05:6402:14d5:b0:601:233a:4f4d with SMTP id
 4fb4d7f45d1cf-6019bf2f776mr7018a12.2.1747418948238; Fri, 16 May 2025 11:09:08
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <878qmxsuy8.fsf@email.froward.int.ebiederm.org> <202505151451.638C22B@keescook>
 <87ecwopofp.fsf@email.froward.int.ebiederm.org> <CAG48ez1VpuTR9_cvLrJEMmjOxTCYpYFswXVPmN6fE3NcSmPPVA@mail.gmail.com>
In-Reply-To: <CAG48ez1VpuTR9_cvLrJEMmjOxTCYpYFswXVPmN6fE3NcSmPPVA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 16 May 2025 20:08:32 +0200
X-Gm-Features: AX0GCFvQ5yyB7VeXyMHb0_GGNIfkJ8FEg23lIrCXszrFcypcHNO0odexRPRgrWk
Message-ID: <CAG48ez3WHp2uiDf66obvtgz1eiGQDokNwCUeouXzUsqbF8oq_w@mail.gmail.com>
Subject: Re: [PATCH] exec: Correct the permission check for unsafe exec
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Kees Cook <kees@kernel.org>, Max Kellermann <max.kellermann@ionos.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, paul@paul-moore.com, jmorris@namei.org, 
	Andy Lutomirski <luto@kernel.org>, morgan@kernel.org, 
	Christian Brauner <christian@brauner.io>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 8:06=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> Like, I think currently a setuid binary like this is probably (?) not
> exploitable:
>
> int main(void) {
>   execl("/bin/echo", "echo", "hello world");
> }

(bleh, of course what I meant to write here was
`execl("/bin/echo", "echo", "hello world", NULL);`)
