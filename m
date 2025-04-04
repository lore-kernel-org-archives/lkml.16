Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85478188CB1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754881; cv=none; b=D5YcImH92sFzg8GYIA0KAe54j7vq26YVXdvmzNWTusom4LFIla/GA6H1+M8m+Qgg73ySNoq352w05YZbJufdMu82od+k6KH8mSfEPyRCulamqOEb/mGlZvUC8v3bVsqWL0/fTirmsdPPVAJvPHeYUaUwiL5gLIafPCqmKjRAPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754881; c=relaxed/simple;
	bh=oEBBa0UwT4LpK4NzDfGAM+pvxfyxo+z9Ez6buIMXpIQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tc7rpwKQxvbJeKj7k/gs1DHX1qnHtLmdRrz8WL6I4kYpErPEe6mzb9icMyFrt5avCuyARphblMWorccZ2FpgJyb84+8bMNp3GcuTqNTqErKMR6lenjJJoLadkz6BePjwAT7xOwLMDfOilCgB6ZzkHnZlg2zoabH0jOK+7ArtdLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJ7KHNNH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ7KHNNH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3996af42857so1927267f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743754877; x=1744359677; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cJnag5N/E8imO6D4V20WNDdVIE9vBf0jkcorR9CB1ZI=;
        b=KJ7KHNNHju5wT8P5HKROJk1c0+HrjLHZlKO152koN6Bg97Aq1GSGOp2s2rhP3k+sBu
         8G/xM6lL18ezUDrFdrbSApd/dvA0b8lmitOSBBdW6KnemPMVQ+S2tbRsRPaqphLi5+PU
         b2XtWQAx5bLV+uvmCZitiLYU8XfOOnVimscwEaSY+UAlu1bjz+f5j9pd1KoHQOVDxvlx
         iYvgVTuCeF5qVj7UuRvv9ycZAfgQnTZBwFTuKs2REgt2g5ygoESi0NuJo7adl+whl5OM
         R7H8kVYM/9OnrZqur3dfEt0mStjV8t61DmN3KTYaLdVLpzBxYaKIvUG1mR+e//8/6Cv0
         ERLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754877; x=1744359677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJnag5N/E8imO6D4V20WNDdVIE9vBf0jkcorR9CB1ZI=;
        b=n8+q8oYF+ERKhV1i/hMwQ0YB7jC8loOyEyC0khjm6gmv0T0Q1q6AchWo69AqUr5Ld7
         XJrTY/uO9qSjo5WRvfyGeFfDISHF6xQJKPR5JuWWlwv1kDmgw1XAhatUN8crJc7O6UXF
         7biz2RY8BP6DyBRQhuWpA3gyED0f8JDfKMM2nXFvb6V+TjL7oFEfsxUV0+el8Zukl0l4
         PRCiZgS3frwZIXQVwOTOXOprUTCs87HfQFtC2I8A5Ve57nAgj0LifIUQM2fqQYP8WuE1
         BTupyZu5X5/pRoXYyZQqcZjwDCMR+dKViysTtSQx0FgLNKUFlsN/m3kibSI/IJIc9vlw
         dutQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF6/pbAGt8vD3ixy1xNeCWzQyl94/lNGcLyrEcMnoZYAxhbToOx+uPOrIt7aa0NnZLgZ240lV2s1QTVSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjfV8BNZAtiWe6i+w0zMUq6Go/BXIbQCs8ORM4qJf/7SJbvxf
	auNBFu75xghoKTwPfCK6LpP/1aot6Lwf0xRblZPnhNK/+QPuXRHY
X-Gm-Gg: ASbGnctoOWV9e/oCp3AgIrPzkM8b9rDr3V0sov6ItetFuTRVwk5bbTQizLzGAk256Ti
	WE3T3ZeCSLdv91+DWgRLbBYBI7lf97mpog0ZqOryml9rpZhVJagP/NxhH3KpKpoarDbni+bhON5
	lGwva8p2LRtNBvNmTpNQaTmpA0zDTN6yD6QgJt3q0UX9ucQ1gSYcV0A8hecfVrqCDVn0ZbdSC+w
	eKvU8Aye5972DVY7yPKvbw5Bw/eg31lu8FpH3uiV7Fw51zKVApDKw/mcPBXyOloBWRFmq7B2/X6
	Znss3aD90SrpUXDJbsHjNYLxQQPqU8IaOS8g4fhfGsoAzLGrqYfqRak=
X-Google-Smtp-Source: AGHT+IHjwKEYxClJ24d2Sr1Kx1XpSNoc5grq1wldrqVQn3q7Oax0SKHigAo7e6h2ExclO/2V4oBmxg==
X-Received: by 2002:a05:6000:22c5:b0:39c:2c0b:8db4 with SMTP id ffacd0b85a97d-39c2e610ac9mr5747391f8f.10.1743754876537;
        Fri, 04 Apr 2025 01:21:16 -0700 (PDT)
Received: from [172.16.8.120] ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm43123945e9.8.2025.04.04.01.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:21:16 -0700 (PDT)
Message-ID: <03ecf162e93d23e1224f0b6c07f08cb85547d3d8.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
From: Erick Karanja <karanja99erick@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 04 Apr 2025 11:21:13 +0300
In-Reply-To: <2025040440-provolone-uncertain-77a0@gregkh>
References: <cover.1743613025.git.karanja99erick@gmail.com>
	 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
	 <2025040215-confusing-sibling-f99f@gregkh>
	 <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
	 <2025040246-series-tusk-bec1@gregkh>
	 <cebaec5995fd21c429160b30795e03c2caa29cef.camel@gmail.com>
	 <2025040440-provolone-uncertain-77a0@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 09:00 +0100, Greg KH wrote:
> On Fri, Apr 04, 2025 at 09:58:23AM +0300, Erick Karanja wrote:
> > On Wed, 2025-04-02 at 21:41 +0100, Greg KH wrote:
> > > On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> > > >=20
> > > >=20
> > > > On Wed, 2 Apr 2025, Greg KH wrote:
> > > >=20
> > > > > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja
> > > > > wrote:
> > > > > > Standardize boolean representation by ensuring consistency,
> > > > > > replace instances of 1/0 with true/false where boolean
> > > > > > logic is
> > > > > > implied,
> > > > > > as some definitions already use true/false.
> > > > > > This improves code clarity and aligns with the kernel=E2=80=99s
> > > > > > bool
> > > > > > type usage.
> > > > > >=20
> > > > > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > > > > ---
> > > > > > =C2=A0drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > > > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > @@ -1358,7 +1358,7 @@ static signed int
> > > > > > validate_80211w_mgmt(struct adapter *adapter, union
> > > > > > recv_frame
> > > > > > =C2=A0			u8 *mgmt_DATA;
> > > > > > =C2=A0			u32 data_len =3D 0;
> > > > > >=20
> > > > > > -			pattrib->bdecrypted =3D 0;
> > > > > > +			pattrib->bdecrypted =3D false;
> > > > >=20
> > > > > but bdecrypted is a u8, not a boolean type.=C2=A0 So setting it t=
o
> > > > > "false"
> > > > > does not seem correct here, right?
> > > >=20
> > > > Is false different than 0?
> > >=20
> > > Does C guarantee that?=C2=A0 I can never remember.=C2=A0 I don't thin=
k it
> > > guarantees that a 'bool' will only be 8 bits, or am I mistaken
> > > there
> > > too?
> > >=20
> > > > Elsewhere there is an assignment to true.
> > >=20
> > > Was that in the original driver?
> > >=20
> > > If this doesn't come from the hardware, then it's fine to make
> > > the
> > > change.=C2=A0 If it does, it needs to be verified that the layout and
> > > bit
> > > values are identical.
> > >=20
> > > thanks,
> > I have compared the generated assembly code
> > before and after and I have observed the only
> > change is the comment below.
> > -# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
> > =C2=A0			pattrib->bdecrypted =3D 0;
> > +# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
> > =C2=A0			pattrib->bdecrypted =3D false;
> > There is no change in the assembly instructions.
>=20
> Showing the assembly is key, not just a comment :)
Thank you for the update. I will take this into consideration.
Erick
