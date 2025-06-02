Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91730232392;
	Mon,  2 Jun 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873950; cv=none; b=kpx4SizjdPF/xrroRV+p3F7yScQCihxD2waJuZozmdbDZ5VolebOQ4/ZeBisgvaZZqTK88IX7Bo8jT3R2QB7hAVVFjUMdWAKLchm2rmYoo/6QohQ7ma5UbC2Z3jQoQ31okoLXSHehBlxAF3fvMikkoy0gPRVUMIqzk/LpYphPKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873950; c=relaxed/simple;
	bh=4r5kVS0cVcftYfc+NQooxIRzaDVLwYDBfYMx1CRa7dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+LfmB9WddfgpVeJ/pC0SN9EAgYfE9PEC/HEgKbwYEL4+C7ECLPRO6xBKSK0SeP9fi7sXv+Dn3wMfM7wldJ8mQdUauTDxvj683q6g9BRBDx82ruLFJc8KKH8dCK2r/o7tjfNhoIuzDdGzosCrfiKueXjyV/WLlUE3yY74qYTTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D24PmkGa; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D24PmkGa"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so630540a91.2;
        Mon, 02 Jun 2025 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748873948; x=1749478748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4r5kVS0cVcftYfc+NQooxIRzaDVLwYDBfYMx1CRa7dI=;
        b=D24PmkGa71DbYYwF8A26zUM8LBs/9OAa7vw8OsILmgSXhq7jZ04zNngKptdNH2J36h
         Wh3QmMsrYxxve6HCnOkPdsFLfjWatR3x8Gi4L2OPJthKRI6Iot5SbULYt9Q2omPdNB1b
         vzQ4Z98zRppB/RT9lsJjvDKVX4VQqptMuRHxSRQgmQjk3IaANuN1/U/yLAsEN4VWH4Fb
         ZZdIkEomv9Mat6GgdMN+UYGgzRQ/MzMmKEq9Yb/ffoaAAozgLKvy9hKFVAnuia5SImT8
         6Alzy+OWWrD+ksmZu/Fb74BJQvAnaWLRXuFLufsxl7egDbB6rw47fPW1GwQ1Qdx1q+ud
         hW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748873948; x=1749478748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r5kVS0cVcftYfc+NQooxIRzaDVLwYDBfYMx1CRa7dI=;
        b=b9PS0hm1AUjPjH1svXSzIGKtjAGr4a8hTR40vh3NyIqa9efj0qqw52R1ZraGAiHKas
         QSd0FZFD4fAbkeRR1JPNOZXP5wdwsLNzp2M29oVVtZv0ANJg4upIx8SEur85F2rh584g
         wdiId7r+raIQJDj3Yc8GFCHjqORrWgPc7iZMJXohUN/tlMlRrbMCbF5FCv4F8rRpTVnE
         CE17Ic9kGVpeg7tbryIuInkvfbGt6SX1WKB93Z/KeUkNdvRAFTS98eOfj6cgiDb6bC/5
         PEBRgHQUbxwak9fIvHLeDfh5/ZALRrA+zxYZcP+orZd9Dok7LWVmDVvbrjJ5ovsypIST
         6dAA==
X-Forwarded-Encrypted: i=1; AJvYcCU8D8riZldFeFH8HEbZSP9+0N1dFJnw/VLDG7DthW/yKNum0jqzS5RiCa8IXwJyJS7+Ll2Bzt8l4SovWDI=@vger.kernel.org, AJvYcCU8ICVbVgpTZPf/LZIJKpC35QPDpxtg7RPLM0YBX0rxLmyvmIS7PJBnJUf3MGTxMZrFNplXoi5Tw8VUlckdqYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXFq1bF1pU6bENNjIw4QnVM4WWhMd49t/rI3Sp2Uk2F8qtrSC
	3ZJDUIIDQNiFh/3Y09m19Jz+Yn6VxowtqxtnYBJODi2ajhBf0FlM30wdP9ExGNDGF3LrL3mQ2f8
	/rOplKv5Wd1yOYc8iNJcnjn9uWCMP7DI=
X-Gm-Gg: ASbGncuWT7bExFb+TnaUC5xKwxNhFB4bUmdeKb3RwZFmPms29pluSKHti8QoER/JfQ7
	nI0gppPz2WLIe387uvrILS2NARNwkXEHdSGHKVKxqQbsTVLcdw7G6rpxIWAq2TBLeFn5fAQx+bw
	31G0B33jEcDTExUNTDFk07O0Sqy5HIyFft
X-Google-Smtp-Source: AGHT+IEehKRNHyVZe47z7GmYH67BYU3GNY9rA5Q2JBwitGzadJzgij5rgUglQAP1qA85fQsMaX3yjcM0LxU7QFqsBwg=
X-Received: by 2002:a17:90b:51c8:b0:312:e9d:3fff with SMTP id
 98e67ed59e1d1-3124d47f2cemr7334931a91.1.1748873947655; Mon, 02 Jun 2025
 07:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602083119.17752-2-saivishnu725@gmail.com>
 <2025060244-dragster-unknowing-23f0@gregkh> <CAFttn56vNVcE=pcGgxGrSZf=r=h_ceFwEf+D71yc9GnANww5Aw@mail.gmail.com>
In-Reply-To: <CAFttn56vNVcE=pcGgxGrSZf=r=h_ceFwEf+D71yc9GnANww5Aw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Jun 2025 16:18:55 +0200
X-Gm-Features: AX0GCFuppXAemaebYLnxsfdRmc91qdrOD2uS-fFCwrVLewW12z3GlU_HdN4YZiA
Message-ID: <CANiq72ncQxzmQkOVo9sNcLvZEWiN5GFOS4Yg6w6NUKMrtX2AVw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: doc: Clean up formatting in io.rs
To: Sai Vishnu <saivishnu725@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 1:11=E2=80=AFPM Sai Vishnu <saivishnu725@gmail.com> =
wrote:
>
> Is it the one below the Signed off by line? To get the complete picture:

Yes, after that and before the diffstat -- please check some examples
in the list as Greg suggests.

> Additionally, I suppose the `base-commit` tag should also be placed in
> 3 (above/below Signed-off-by), as it was added to the very end by
> `git` when generating the patch.

Where Git adds it should be fine :)

In fact, if you have a good Git commit, and you use the right flags,
then Git can take care of essentially everything for you, i.e. you
should not generally need to edit much (or anything at all), though
you may or may not want to use some of its features, e.g. notes and
branch descriptions. Please take a look at `man git-format-patch`.

Thanks!

Cheers,
Miguel
