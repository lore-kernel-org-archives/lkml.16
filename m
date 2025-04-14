Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33E28A1F8;
	Mon, 14 Apr 2025 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655187; cv=none; b=OCdj92mRNsLZr9PNLGSLU13Cy0dGdPwCSGhBcRlfew2f6ytkj8MtBIFO9J2DHGYBxbgmRoEzaljLdX3hPGQoV0L4Klhm/RddWF3RTzIuewhp0cUOydMiBrStRseH4rVN+d+Krevh0dSFPjMa3nU+Mm8cEJ4KFL1oV80O3GcUerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655187; c=relaxed/simple;
	bh=XpQ8fUhF9kTmi0XEYGvAnNQNEJ7orpfWFg3wjhoXy4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyETM692UIWnLhVzFN8bwIJuSVjPLuXdTAig0SaTmCBT3SQkEKPXoXvN1c7nnUuGTXn3aCzBvczxc+/TUDLeYEt5F2/6id+oSOQlAHW2wBxP3xaq42zxOsh88V+Rb8EDEpaeP0ItOKRx8LIb7oUCbOzFZW6cB5f89SpczbFBSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqVaPFyn; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqVaPFyn"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso47831681fa.0;
        Mon, 14 Apr 2025 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744655184; x=1745259984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpQ8fUhF9kTmi0XEYGvAnNQNEJ7orpfWFg3wjhoXy4U=;
        b=cqVaPFynLg3Hkp0jexFuufTx/ODRLYBC0Kc49aZIOeFAiOO8xtGaYuF4ahTdTT0Qlg
         Jp3rsuWVPLcEg1aWoIyGpG7vvYFucrzwXzEus30TbRT3pw6GuO9dhqTN+4YbiUFN696Z
         G2sQghCKz7Ydz66WNQ0wi92e/BMesUvmTeF/DtWvVUExLjcLKimaxA7dO9DEb/8tlpB4
         +KTKKq/S25RW0uGzCI5iCCtcjULSbY29+Fd0XoQk1oBi6p3AebHnl5PJkSSfEDRuaKBH
         tBRoxqj2YZx8IBcz4uoTTEm0VZy8o4X81ITMkORr1lRBZ+5HzPhfD1e7+o1bewd8MxoV
         V7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655184; x=1745259984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpQ8fUhF9kTmi0XEYGvAnNQNEJ7orpfWFg3wjhoXy4U=;
        b=T/TuKEtuQRXN10eFI4LyYDXudOFotQCUJgQ0DGq+0yy4Si03lSiB/ApzJzdNUOBQID
         doyGuprzxp9L2TTGaWOvqzZwm/aqeVxTdX6zqN2l25TAMLHf7aJx4OoKyacBEFOwWsRn
         +rCCqFS9QHXAoKpWXQSG1YLw+RKMWBW+vtIzhM9FaRrp9shO0TIHn4oIK4dKNDpttIMr
         LIIwGbMZ+jyufdjgaq1W4jaGl5g6gRbGrTHG4j7iQ5AYSLg6hVvUhDfMh8S+9wgtY+yp
         uTjohg9Gg8yvHvfnumn0e6cCXZ9AgOeoo13ARYXmXvSdmBxqGHWR7aK/mrwBMToWwIIt
         k6+w==
X-Forwarded-Encrypted: i=1; AJvYcCWGIzybDws81uixxbUfoA4wo/KrqSjPGPLM+dDMQN+B37lcOFY+/t3zOKlxHvIpfZBRYJB69ToIwG6TZHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZfZJmtju0CiDIaGo68e67ABk7ctKJpwuT8FP//x54/u2nc5L
	4FoaFqkKa60nPk9FTxMcJTmYeh7VivZmAdBqyBRHSdWT/ZO6RtGrihDbs4uk3DVtApmGzlYgKSb
	Dnu0GP7qas6bbtyxWAO9WvF7IhZhGg2pV
X-Gm-Gg: ASbGncsVv/MltiXZx0hz6ypPmgr38J4Hp6grVdRCUqY/mLEtVvjxMELqJt347iSo/rT
	YH3PMbPy7dJ3996+9kI4xORZcaeQn8CK9OacK1+rk/GLN6ok2ci93KmhvZUG6JhUHSiLxWnsKG5
	szkmW/Bj1V4HfVeBdsoFulKbcFyeDtDL9JFHibgQ==
X-Google-Smtp-Source: AGHT+IEeTMtdfekgUVDwOdhRHmyuSpDt7+817xh3+IgPK5QS33Z7m7kYqQgn8rjNZvRt856SdDZJlPW8zseM4nuYpsU=
X-Received: by 2002:a2e:be14:0:b0:30d:e104:b595 with SMTP id
 38308e7fff4ca-31049acdbe9mr33289491fa.41.1744655183792; Mon, 14 Apr 2025
 11:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com> <CAJ-ks9=3ckTSWuCWq0SV4EX75a_c70c=VKjur-+GFUHKi8+zmA@mail.gmail.com>
In-Reply-To: <CAJ-ks9=3ckTSWuCWq0SV4EX75a_c70c=VKjur-+GFUHKi8+zmA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Apr 2025 14:25:47 -0400
X-Gm-Features: ATxdqUFLBi2YevPASNx3vvQ4YHiYQ2isz-zN6h-1MpPTJn_Jv5eVGSvEL6XX3zU
Message-ID: <CAJ-ks9k3e3hyWXKZOyzR_VYinKwfJoMy+WGxVbAtA_yOQ=1bSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: split `Vec::set_len` into `Vec::{inc,dec}_len`
To: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:53=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Mon, Apr 7, 2025 at 10:52=E2=80=AFAM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > This series is the product of a discussion[0] on the safety requirement=
s
> > of `set_len`.
> >
> > Link: https://lore.kernel.org/all/20250315154436.65065-1-dakr@kernel.or=
g/ [0]
> > Link: https://lore.kernel.org/all/20250316111644.154602-2-andrewjballan=
ce@gmail.com/ [1]
>
> Oops, dangling reference here. I removed the mention of Andrew's
> series because it has been merged.

Benno, Alice: did you folks want to take a look?
