Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C862E2288EE;
	Tue, 24 Jun 2025 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763312; cv=none; b=hWlvDf39SxojfCo4WTQTZm2fOEDAybuQUKewFfkQdpL++n5Rhd66CZc30NSYJsXKwyNUyUEwvQd1BKuxYjvXgfZs+TDzIDE0Gp3U4XT4V8ad+Ewdfn3jYYuA97/khEeeBVIIWWC4/d/wHl2bt0g43yZqn5D1EUl58k6XduleqJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763312; c=relaxed/simple;
	bh=DNg1JCVsgEHf23k4WG2oExPiJlj+bBuyEUK7sYa8r7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYzOMRgPh6/GHSsy0N0T5zHCiVaWBbICp27xcnGT73YvMCR/atM1Dz1Vw3Q5o8r43Yw3U1PZ3EGATCmfd5GOP6LUYe7xVzFYzlllrieRd5zIQsXi+cP5AQDx/Lp/edrIzmHEzXH/emYuoznYx1cnuG4A0jKUOP9PUUirtDYtKbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiYfk0Mw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiYfk0Mw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234ae2bf851so7339245ad.1;
        Tue, 24 Jun 2025 04:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750763310; x=1751368110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4AdC7xJ04CgkqAaAO3h+p8gGTP59K3A/YKahZ0U2Us=;
        b=IiYfk0MwfkA110jQI6dgSM2N/sLhKUKfapDpomoAKFfN293MtF1CY5zi95RsJZ7mR1
         JFE8lGfj3YM78UqTLM4QIIzwlMu+o8PTK0bapz04oK5GFktPcbb3vJ6WS1prCd/l9S/E
         +1GUkdzGMj9/ptxkWZiJc6DPbX4zuNrvZX9IMukmp4Wb3j5A0HtPcf6w+k8CHnobQve7
         bsHkg0aF9zbiCgU11PhW9eY3Ef7fLOwp1PvrhnifPKtAMUBSYspZo0NR0kc/tQeYTGaM
         VNzCnM1t9TYtUZp+drYESB0ESFS+vP3ssH0sTPqp+ZPTVfDIBKWOpaxaOw6UcsGLor9b
         lJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750763310; x=1751368110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4AdC7xJ04CgkqAaAO3h+p8gGTP59K3A/YKahZ0U2Us=;
        b=M58QtE+z7g0xYPeea2hkbeWWFCM3sQTPtL6L+GpDS6WFnf7Rp3AA5mDtRSpd0i3WiY
         s2iYSIKAYeWwuHBq1olWv9rGav7XUSys3kAgO2+SNhdNd4cCDn3L24hJ+87DQbeNTTm3
         17wN6KA04DPvirQMZXX0mp/pwdJSmhWYorJoc7NCnpKmQ9w8CoE29MT4Fpov8uIYUpB3
         Xc0BQMEHnGscL7opYvRH+3t6uilsIVdTkRmMpRcBYxfCraitFtv56ovNPikfJqzKUYm2
         whvUIBuegHP5IkZ/Oa4LA15GgdynPY4wLa8ZOw2By0C6SI7A7z8fom7TDkzKWT+Um4Lj
         D2rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvcL+/oTeJ8Us0JdssmVuBAhHj+zl8SwutNrX2pkA7ENTQGUX5S8OEjTj27IFKZShMuY6E4h2UZRrdxr8=@vger.kernel.org, AJvYcCXqEdKuN+HOP7UeZWdLSgppjBuepeV8deq9wF5qn9fRLj6W4wioH7q23Arz+dg8/AwVn2/SXGXkTsTrIB+g2jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjI5HtpWngWvBULFy6cjWAw0/zOZTy5gw7fGg+JV1TYJnciu/g
	/VeOaqsQpS+HirAm780FBDfoOIvJeFwTjywgPceHbJb6Z+PADY0wWGOT8V+/0acEw9ogBTa/yJC
	ckPXOKSN4Rn370M7rnfksn3xIXAOIlH0Hr1xRCuc=
X-Gm-Gg: ASbGncvFyrlEW1nnfCPFTRfJibK3kdseM5+dN2hZ85BIIZkFrySA+GtZZkZlB3PM9TI
	J/jkRDXqEuFRgY4ovn1minrhsqQiMQl9Z1XsKuGNbDvaGZbIyPzzS9z4OOQdEuc1bu9Tk5eRzFF
	gxQ8XChgLM8bRFaayPMbykTMlSkII/+Vf0IFCoP3+H6WM=
X-Google-Smtp-Source: AGHT+IHnFuakCpfPBkjJNvFKFCJKt0vC/f+jLh/CjjCBWyYIGLi8aAa/I/GMHz7wT/6gQgfix8FO3sp0tGSeV4FtsYQ=
X-Received: by 2002:a17:903:2450:b0:234:f200:5194 with SMTP id
 d9443c01a7336-237d980d929mr102574535ad.1.1750763310017; Tue, 24 Jun 2025
 04:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com> <175015666837.277659.5038961663728008472.b4-ty@kernel.org>
In-Reply-To: <175015666837.277659.5038961663728008472.b4-ty@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 13:08:17 +0200
X-Gm-Features: Ac12FXw9NRLPGpki39ay2NhQnfu75XaImkNq6s2i4SyS7A6IERIj-PvCYxubfCk
Message-ID: <CANiq72=mDe2kB4yQnzb=kwopyUYG936pOoj80YpWk7+q6aJwbQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and Delta
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 12:39=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> [1/5] rust: time: Rename Delta's methods from as_* to into_*
>       commit: 2ed94606a0fea693e250e5b8fda11ff8fc240d37

Do we want this given the (~ongoing) discussion at

    https://lore.kernel.org/rust-for-linux/20250617144155.3903431-2-fujita.=
tomonori@gmail.com/

?

I noticed due to a conflict in linux-next today.

Cheers,
Miguel
