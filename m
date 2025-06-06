Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDAA3EA63;
	Fri,  6 Jun 2025 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749176463; cv=none; b=il95POJ2k/yUb7emax+FyC4btlmYc9Xgv+iksk+uXFFL8pzE5WIbyW+9rF5iNZzbDE6fLvry62T7a93av2tRuy1iHuDtEs1bVCSbxt3Q8udDuzb0okbqfX2lAh0dyxD9bu7JGYyKVHWRcdtrnNl3qsN97opnzVSdvWiRNPh7kW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749176463; c=relaxed/simple;
	bh=+/w+ezUf7X5NnQhZCOExbM6FaBnwc0JdGT6WrIiD79k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUkYA4a3fxroj9byQaDLCcyQ/oeRUMMQsIDHbQbN79viBmIC/q5hrmtxhywc5ZWw1wV9fkQ0VARkwBkGKBsuMZeq9SwXnI7LuzblpeY6B0blcfl60PgEO8W+LdrWMEAPG6Fg1OF8pdp/N73lnErwVXKwkSC/gBo+QY7bDkm/tOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDDxl+ON; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDDxl+ON"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60768e108baso938116a12.2;
        Thu, 05 Jun 2025 19:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749176460; x=1749781260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/w+ezUf7X5NnQhZCOExbM6FaBnwc0JdGT6WrIiD79k=;
        b=HDDxl+ONb8Kxjy5h/GK+lwfmijRPRJMM3vb8Oj9EKT9gNv2FgJDRTjiBG5w3udU7/o
         nlqwpqSOIzj8W+7f/0+ZbAHyFI1sPq8r/teIU2rYGQAntj6bhEpOfq59XStolQ5mUHDl
         MwDpKbubCfv4CoSalkZPnHj71Af8fmr6Ab+twgEux+7oVybeCeRq0jXtOEULmT7mIS6V
         nuDSW0N+iYSyZ73Ri6Avo3cGPldmI1p4j7seJZu1U4WgAcqZIQ2oixnzILxvi/KgoAlR
         rOyzTU6ycCzGu1RLqhSkcYfxtH7rPCPUrWOPo9x4Zb8ntlnLTX6RJLvP8zdLXVlviPri
         Z9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749176460; x=1749781260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/w+ezUf7X5NnQhZCOExbM6FaBnwc0JdGT6WrIiD79k=;
        b=DJdaj7vnPH3/4X3IxIeD9QZ/eglAXlDLW7MBLIsHhhHH8YXlA/Sh+F09QJd2XQIQpz
         C8D6iuwwFGEKBeeR8fh3TMSGFp7dV+LFIYy9h+SNoGD3J+CDIxEpQzyd0pj19eSnInsE
         NwiR2vEsNEUykGxawOTUHDUAYzjGFDqCgJXxY8x4KtoKaUclPPnHFWEzsrUarjb+5gAW
         +HEX9oinF+juObgLEJ1nSTCFjylINgrBKUwjYnj6EFf5y9py/RMwFPQp9/O4LuXm14dt
         gmKWnHnjyajPs9+y+XG3/0YfPb8r8KXjNo3uRPh3EsaoaERUjy1JAupxu3Oh3FrPP+4i
         j1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9+MWMgFCyc3mOWXiogMCgeHiyAyeg+AqGY59/VVk677QhSXqm6f7ml4MOu458vbW4cD2mjW/ZrR8C@vger.kernel.org, AJvYcCVSkV5ng3nb8IiBxt6YqwaMRwBc2nK4BOT8f5XqK8qy0HT8UhthaXSdtZp/iuASnkFCBftzVPvxwH0e62yL@vger.kernel.org
X-Gm-Message-State: AOJu0YwkOmGCL9PuQ0IGrKPxl9N2Jcius3WIzHfqm9ZoPEeOmt/g4KMv
	bceKuCIzuWldOPMPrpeGPCANjP5fdixU58xSEwUni+HzuYBGggc9Eqk2W8vtGxqeyK7PtRlpZj7
	W7MLTlb5O9HeprmevYdGvy/030/C41S0=
X-Gm-Gg: ASbGnctvKUv+zSJiQ6e+JKBhoeZFRc53TN/WDcysKjYZCErXiogBD4y7MU7s2Qi77bT
	CjsdYc1rS6aeaA4iejMM0PfTsaBzGS5yt/QGNtCSyHXOnaRQ1Y2dMqeZA6UGAn74AgkQB6ttCgd
	lHVTH66HwbtvdBFwtVcTdfexFhM4LFync/
X-Google-Smtp-Source: AGHT+IFc7VIpbhtGV5mGiNrX78q/D1h2yxz4sJe2yXc/ZDu4l9xgq48hcedhMj9dud5ev9dujOFwsPoX+nc+SkHMwjs=
X-Received: by 2002:a05:6402:524b:b0:606:bea1:1740 with SMTP id
 4fb4d7f45d1cf-60774b7bc65mr1128147a12.30.1749176460253; Thu, 05 Jun 2025
 19:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520021440.24324-1-drew@pdp7.com> <aCvnXW12cC97amX3@x1>
 <20250520-refract-fling-d064e11ddbdf@spud> <aCzvaPQ0Z3uunjHz@x1>
In-Reply-To: <aCzvaPQ0Z3uunjHz@x1>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 6 Jun 2025 12:20:48 +1000
X-Gm-Features: AX0GCFvIt_VakDMPR7VmzL7GHuJCZDjXNytVbW5mNeBulllFm4neaxbMh2Ug6zA
Message-ID: <CAOSf1CGLoN7u18OOPZ_FGiYvxUninoCAvR8CJiOLGJrORCghdw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pmem: Convert binding to YAML
To: Drew Fustini <drew@pdp7.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, nvdimm@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 7:08=E2=80=AFAM Drew Fustini <drew@pdp7.com> wrote:
>
> On Tue, May 20, 2025 at 04:51:42PM +0100, Conor Dooley wrote:
> > On Mon, May 19, 2025 at 07:22:21PM -0700, Drew Fustini wrote:
> > > On Mon, May 19, 2025 at 07:14:40PM -0700, Drew Fustini wrote:
> > > > Convert the PMEM device tree binding from text to YAML. This will a=
llow
> > > > device trees with pmem-region nodes to pass dtbs_check.
> > > >
> > > > Signed-off-by: Drew Fustini <drew@pdp7.com>
> > > > ---
> > > > v2: remove the txt file to make the conversion complete
> > >
> > > Krzysztof/Rob: my apologies, I forgot to add v2 to the Subject. Pleas=
e
> > > let me know if I should resend.
> >
> > I see how it is Drew...
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks for the Ack and sorry about that :)
>
> Is it now just a matter of Rb from Oliver O'Halloran and this patch
> going through the nvdimm tree?

It looks fine to me, but I've never worked with YAML DTs so I won't
pretend to review it.

Acked-By: Oliver O'Halloran <oohall@gmail.com>
