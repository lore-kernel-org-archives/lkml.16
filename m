Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E43FB1B;
	Mon, 23 Jun 2025 23:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720462; cv=none; b=BddxEIkWBxxKFrDTlgVLPVZuyPvOHZYym2GbQvXXWpjLJuqvezxwMgyPhLY5/hcecVKFUODdaJrNHDVMIDb2H0y64a0rnm1wC2g2YsyQ8Z3b/xkH1AzK3yvA/Oixg5JQKK9fpvwkK7fNRR2/t3/hf1Vt0HlafYP/wPL2SrTpNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720462; c=relaxed/simple;
	bh=qZfM3+qxtQpx6gfqjvivz5oVhIMPAwRL0sy7SYW70eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAjGoqod7l4mZjocYo3iNqUd1OpJPe4QmtAh+dCoWuoW+TFrFvPCXnAn1s89hz5z+rH5m0QUkWvytmQwVGmD95RCnyk8aDdBiXpeVarEvELTCM673Ww4dHqIPi69uY6GCG3OZIK7MuWmjXv+pPZnfF+4CeTLKdkm4UGnyjMfqa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzZ775JC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzZ775JC"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313756c602fso540903a91.3;
        Mon, 23 Jun 2025 16:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750720459; x=1751325259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sngl8tyAMi3uwXk0DJtqeHxatiEd8iNe6qf5tHF3BoE=;
        b=DzZ775JC1WEsIo3UR6y3mkDzESljWtO3gxBTxss3N8usEHSuxVRWOZOUt3AA236kJS
         nJrhvvx9AfwN5vrDg9AiIRFkQJfBQ+Saaydk824GksqsGSzE4FaBi1WT+Nc9aYdsZG+r
         2QBRIkt/3nOxSZ4CGoPkT/IxybBLIAHP1zdEb1OKWS4JL9gKe28XuASj4IiyW4+T4PYx
         x34SUQZJgkvR9zlOiAu5vwXb/dFL/s1/QgRr3rq5DoIKlHJn0FQuohGO4r0kX9wLKbwH
         u44ZExUjNuA5BMX1gsoMeSjNODVvzMjfiIHBEDcsL49qdX/WmUHXR73ZJ2rpx3UgB+ys
         6edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720459; x=1751325259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sngl8tyAMi3uwXk0DJtqeHxatiEd8iNe6qf5tHF3BoE=;
        b=IJKLOyK2QlbXaszjPlqrbzLOP8xTnSXeeb1Iix3tnrabJO54SmgehjsUfciXkVhaOb
         RsT1pvRP9eY7DQjG9xuck1jBt8RPiKqqzQKgr6ql1J49DBylogryjYsgDeCWNhwxQD9l
         tOcnghx+qOfZCVrI7HMV+CM1gGfFo0eP+3NZLrgJaslHCLbX8HRQqpUJU8mB3LbMDkFr
         TtW1J0TiyVQnf4zNTZ08/G4Sd9nJx/PP0IAvMNtg4wCe8i+k/vDIXhhcEn+5Zdcqu3eI
         BFv8Us+4PK5PYBR2RYrX5xyKQYCXnfe3LBLL6d4yGZv4S7k7uI/fDpCbsoCBnca5rMWc
         UI5A==
X-Forwarded-Encrypted: i=1; AJvYcCVkcLTl+HXjuuJGIuhF0t6KTAHO8zoiHypCrckOCj96gdarDjpAnUELHTV3Mq2iDE0PZoD6HQ3uDtyzafA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCQb4y5WjlPnART8byPR4SJMEoLMn7fluTlZj0ef5cFASOJ2U6
	WF2e5SBToYKGTeYcbXvkPcfaqtI+hXxwvk0Zem2CQd5vyhBIGT5nIlH7D1sH68ocPVLxhlm/4Lh
	7wnfHGxM6t7Ig8UB339b1JblpCNef5Io=
X-Gm-Gg: ASbGncu0CrQ/CiInDTA7R5JXx70Gv0STEyjgWxCwhiVeAOxGoEadsocTjb66NmkcfB+
	+hVQXSk0vlq5QKhkNB57dL1JQGW+HzaZuH/ygaSOU1QkSqnzquNOCMJB50Aflo5w8NQ1QaFt3vN
	5b09Fhxjs8ib875YoyDTxK21KA37ZfWVBs/pUK41WW6dc=
X-Google-Smtp-Source: AGHT+IGZ3tiVKlkXWPqLG9MnXGdRjgQCZE/XhXvv2PUbhwLgT2jcWW3+NJWC5d8bHaCU0LTeg5qzWb4swSkwpApQ02s=
X-Received: by 2002:a17:90b:17cb:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-3159d8e05f7mr8360421a91.5.1750720459212; Mon, 23 Jun 2025
 16:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602164923.48893-2-saivishnu725@gmail.com>
In-Reply-To: <20250602164923.48893-2-saivishnu725@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 01:14:06 +0200
X-Gm-Features: Ac12FXyqZ3g-1ON5fFexR90xH35tHfSbVnzNE1OtPfzOPTL7_G5-x-04YBhAohU
Message-ID: <CANiq72=drJrCgfrFyyDOKiEANPMsOEMxbwJhcqhPWEchjAvm3g@mail.gmail.com>
Subject: Re: [PATCH v4] rust: doc: Clean up formatting in io.rs
To: Sai Vishnu M <saivishnu725@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, gregkh@linuxfoundation.org, daniel.almeida@collabora.com, 
	me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 6:51=E2=80=AFPM Sai Vishnu M <saivishnu725@gmail.com=
> wrote:
>
> From: Sai Vishnu M <saivishnu725@gmail.com>
>
> Removed reference to internal variables in the comment of `IoMem`
> This avoids using private variable names in public documentation.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes:  https://github.com/Rust-for-Linux/linux/issues/1167
> Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>

Applied to `rust-next` -- thanks!

    [ Reworded title and adjusted tags. - Miguel ]

Danilo: you originally added this, so if you are against this one,
please let me know.

Cheers,
Miguel
