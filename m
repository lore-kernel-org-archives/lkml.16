Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84036265CBD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106293; cv=none; b=u9dysn1Imgl/Z3MlTfMciONUXXSCFmCo9Mfy+STiHuB/mA/hsWCx2n4rE2fIthCy1Kd8RkeIsSZ9uiXa6RbwEFrfDGsTsZo3iO+MMa6ColZ+LSWyqeEQbbchIG1hrAX2ehJJUtfhJRZMvnYe72h/ZI6oVWbIjtgNIhx7W2o4FTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106293; c=relaxed/simple;
	bh=E2QgDpoxCcKb2INHDykh1htW9Vy2w5OaINdf2ihN35M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJoqOc20jGpw8JTkUuD6JO84wNf8v1fb0eF9SsIgbqkqSudCZQi4B+Oh4XiTbowUY8nZGVqWgDZK+igfIUM9JHTeidLJ8mNyi/gnGCJbUec9ArgO2TLpIr/x+2UtbYKw0wYl+ReYH09+wYSjMRz+jwgzxCtRTzXJ24xXzev33W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hmc4Gurq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hmc4Gurq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549946c5346so6306939e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744106289; x=1744711089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2QgDpoxCcKb2INHDykh1htW9Vy2w5OaINdf2ihN35M=;
        b=hmc4Gurqp3AlHDlmaghMLd9g0yqXWJoCAsTiCjE+bbqPO9JI9UjVskvF/fU1f241yQ
         wEI/EYNV+yKIV/wG8qQVh3ND4x1CBZPNEO3JDzaMz1gKPyHvjzGlnhRYNN5sVClYDnRx
         oRmupejSjqgbJnqLHIVBOZTowlkFrhwyG9PfdCKBUGgMA0yC12l4SvJuzDXDxaVN8N+6
         y1/Dbql9I73x0D47iy6YhSu3wYjqluLrZ5V/SfgpMub0bZpR3JmoI954DtX53Yw7HGRV
         xawCUqp4dUYPR8pZ3s5EEwHdCQt5txKMbIBk7/O5g8E29zdJk8c61BvAsqfqbeHS0fY1
         up6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744106289; x=1744711089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2QgDpoxCcKb2INHDykh1htW9Vy2w5OaINdf2ihN35M=;
        b=bbEpQID2gwgnkjsRDwCTuHMDmYGzBzb1fpD19ZxjsyDEnXDTkm4qi2X/EcQbd/8QHU
         4DChV6tOt5aRhwBVMiBT/B0ycF3iEbeA6Cjdz5fWfDoP6HZ5yvF2iX0ewryHYi0x8Uky
         RY9x42F+aCaQfW8crHeg8EWxpUQBXubgyJvvW7oG0nrzQ3YwZKbAwEU/FUU/HsiLptVl
         k0uhGu9XLWJ8hrdWbimSvMNswtzvFS8a1pNFER2De3QL+sccVh2QI0DFr0D8sc5W2An4
         b2TGTsTTAjuY+Fs/3iSg/I3smAk2eWHVYITllA+azENq8rldK0VYTpXIQ6kj/u7ukOQh
         am1A==
X-Forwarded-Encrypted: i=1; AJvYcCW4LiO8zWtD2OADYwoE900YMNyK97/gd4yqeJPlDTGgcgPZtMDyXnwYmx97yFN61UUSMdDvz1Nbrcj1Sns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbyPac9hqabZeOx92UMfm5uRpF1xcokM4PvJweGciecqiQn52
	5gbQL5xCpUENgdl0vixtVkpv6O4ij2EBF2h8Sj+VuV59CfQiioHX0Absa+L1HHxynGWJT2sGe5/
	Ic4QWd8qvSsHU+BoamfiBUOW7yFASGzKX3gcJgQ==
X-Gm-Gg: ASbGncscPtK/dpTG1MpP4Z0U+z14DSONv0phpm0TU5JqA+D0ytF30OLKSG0YzirXXkB
	A4uPjLSOx3uWq1CvjHmpCMfHZRf7CaFkJtpv9bK3ZPNeSF2fzIUUD6DK0pF4LI1ae0DEJXRwkSp
	iZORGeN4Clx2RQfHHPmjQzM9h7O75WCj0C/C+oSvswHoAaYL8uZfgpqqQ4WA==
X-Google-Smtp-Source: AGHT+IFx+bvhcS/ETnVr1Np3Ug4zUmPWJ6VvMwny/VNMHDECNGK0JObtu05hxR2rh6XM/f3a9h/6JQOpVobQ4HLmOU8=
X-Received: by 2002:a05:6512:39d2:b0:549:b0f3:43a2 with SMTP id
 2adb3069b0e04-54c227dc8cbmr3950486e87.40.1744106289554; Tue, 08 Apr 2025
 02:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408082031.582461-1-jindong.yue@nxp.com> <CAMRc=MfuHs=7vda2CaMzHfVDXe41TV3u3ezPmt38xJ9=8JD1sA@mail.gmail.com>
 <GV1PR04MB91836DE75CB528C1B9CFB8ADFBB52@GV1PR04MB9183.eurprd04.prod.outlook.com>
In-Reply-To: <GV1PR04MB91836DE75CB528C1B9CFB8ADFBB52@GV1PR04MB9183.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:57:58 +0200
X-Gm-Features: ATxdqUEGEOr0dw204y3YmGV2yan7VL_T-GvaZ7q3qyHQO0_mJqqeqTSNoCQpObg
Message-ID: <CAMRc=MfakE0aKwD_udfP23UQ2nVL29GLiquzyv1b9qYGp+fgSQ@mail.gmail.com>
Subject: Re: Re: [PATCH] gpio: vf610: Allow building as a module
To: Jindong Yue <jindong.yue@nxp.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:46=E2=80=AFAM Jindong Yue <jindong.yue@nxp.com> w=
rote:
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > Sent: Tuesday, April 8, 2025 5:06 PM
> > To: Jindong Yue <jindong.yue@nxp.com>
> > Cc: linus.walleij@linaro.org; linux-gpio@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH] gpio: vf610: Allow building as a module
> >
> >
> > On Tue, Apr 8, 2025 at 10:20=E2=80=AFAM Jindong Yue <jindong.yue@nxp.co=
m> wrote:
> > >
> > > Change the config to a tristate type and add a module license to
> > > support building it as a module.
> > >
> >
> > I can tell what the patch is doing from the diff. I'm much more interes=
ted in why
> > this change is needed.
> I am building the vf610 driver as a module for use on the Android platfor=
m because the Android kernel (GKI) doesn't
> contain board-specific drivers, it requires that these drivers be built a=
s a module and loaded into the system.
>

That's fine, just put it into the commit message.

Bartosz
