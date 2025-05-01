Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493718024;
	Thu,  1 May 2025 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746136019; cv=none; b=Nze6S+bsrDt9jfIcjKw8LGrM0GhJaY+vDjDiuwP4QzTdXMcC9Ih3YkEeYmx673H5sqJpUiSN6sIUZ5AUGBWc+RWx7sl4yuQm388hcxLj3Uig4HdwnLh77S+D7kapAKapt46D70bOr7n47qb9XPoQTGbPY/HApmeVbExQy6SjEtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746136019; c=relaxed/simple;
	bh=QMC8DLZApFFYFC50AWMgkPf4xSAD3S+2WSqmy9/34ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+j4Y82gi+nGn4opecDZpTkUsWxOQm6lzb8ub4B1YqlpEgoeupupDtfZtE0kj9dQgn2X0lXab2uvf1Zd8290lRkDocFfzdtbDnP8p3wfA+76groi6+3Tnt+i7Me3up1TcOFgc+VgeOk9v8AqOuZL5+wu8vedb2jreUkXCX52e9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2ahNE3A; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2ahNE3A"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22403c99457so2847455ad.3;
        Thu, 01 May 2025 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746136017; x=1746740817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMC8DLZApFFYFC50AWMgkPf4xSAD3S+2WSqmy9/34ns=;
        b=M2ahNE3AUOTx1Eu7f2TmiGBJVz6FbFOBkMRkO7PVxTi8AR30KHqTyXYhZZqdwdpDDO
         OBQd+J+KSx1tEEDdlmMOVlP9raH4h+jSz0m9K7hAZWFRq9oLH2pzkwBm1+kshAr5BT9y
         sRb29qVRLXsabDalj6icALScvtomAovoTVPGJOD5jp9HezC8jhmCx0pZ3teeSNnydPOz
         bXqz++OIH4SFkyzfLAq7Hq6l4vP0fMKs99FmFT6JbYDYjONhBLyZQmIPEcWUV3xzbg/K
         rEvq7fW+UZPWuwxQ7iKpDd3uWBPp1a/NDldrMEDy3sIkeQ1Ncju0KYImhdPCMTHpswGw
         lnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746136017; x=1746740817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMC8DLZApFFYFC50AWMgkPf4xSAD3S+2WSqmy9/34ns=;
        b=daZaBuTVpOuj4cHwsNMOMZHJ9qsR1fy4B8ToblucYyk63TBIKwfyRyFP1HLtY/yIRm
         91LHykYkS6n5doo7wJANV15KQhtvHqhiZLpV267ns1V3SRRUPJscM83cAKBtKR8dc/+D
         1R4KNsEMOeNFCa9c19TWn/tp20uWF45gqN6kQb9TBLFa3m6YhygLV+qNPe1T4ic7nOhG
         gJpABG51O2fTbpMMnK47SHt22xYMiMe+vVrnUu4uk9h3e/uim/ToErlY+hEYkH9D38um
         pnytSI+Hci3zugXAFzMwQylyYMzoiaTwyE0tQgc9rSfFCOXOpoEy6C6vFcV29ydreqLn
         gMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlt9iNA/nzlu6s0RuenRLRXuWLUlH5uGIY5luZM3tvfdFx8OFmcY77NnelwU5wwlufrfoI+uK2Nm5pA3pZbBM=@vger.kernel.org, AJvYcCW56+Xq7GC8lgBOoYKqS4T16pNiqim8XbVXkOwVhzXL6//PaZvFnGbEaVt9XqLaBtRcXc/CKKTk1BjqkgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2f+Yw2toF3/n66epUneC7Ki0kXrGT+7JdPHOiljLzb7/L7VGR
	bQLGoaSCfDgJuBoEazgNCMF8AKoSNER8IG17/lRKf6pKr/jKVFspZDokGRXhf4Mlhws2XaCv7i0
	2aAdP1f2vCM+C+1vk0c9RKsmPPZk=
X-Gm-Gg: ASbGncskO9PPp90M1yy3OdesFEModUmKVOykUdmc8B/NFzsaSCrv3/s4F/6z9K7QvmQ
	uVE9t5G3i0+rZ80LxvujI42gGb3n5KQhu+aTQeaIHhM7V9H70yz4RTk7aiaSmPdtIMMlAL5DQnT
	2nc9qEep6MT+WwpNd4jmqTWQ==
X-Google-Smtp-Source: AGHT+IESuL7Qc6XTsBhpAtqXzhletyQIGiElw+SlfHiBS58wUui1CcqyyG3f5lLUtpusebU3F76XuiEjep5/BUHpecU=
X-Received: by 2002:a17:903:2bce:b0:21f:1365:8bcf with SMTP id
 d9443c01a7336-22e1032754amr3686825ad.10.1746136016681; Thu, 01 May 2025
 14:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
 <20250501-configfs-v6-1-66c61eb76368@kernel.org> <ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
 <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
 <87msbw1s9e.fsf@kernel.org> <86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
 <CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
 <87h62419r5.fsf@kernel.org> <FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
 <CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
 <87bjsc154u.fsf@kernel.org> <CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
In-Reply-To: <CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 23:46:44 +0200
X-Gm-Features: ATxdqUE-JIQMTqC_p_lKTC_xXFyVPHwvVC0wFeX5jN_WtoUZwrE5ONQawNNANsk
Message-ID: <CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Breno Leitao <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 11:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ah -- that explains it. Yeah, your calls to `add` were from const
> contexts, which explains what you were trying to say.

No, wait, they are not from const context. So a "normal" `assert!`
there would have never worked.

Cheers,
Miguel
