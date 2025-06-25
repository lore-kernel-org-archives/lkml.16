Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F22262FDE;
	Wed, 25 Jun 2025 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857076; cv=none; b=avZUmsMSpm7WSQeYadZGToUCOsZMG9HDLpzu529NZz6C0IfiMHdaOIhmGHjT3B7uNpw17Fg7W3v2NW0LDRClmiXIZzG764TtZcyFm/yqnAN++IP/mSBqCsTBluynURX7Oyo+2fv7WB1BXWrvBDQN8mIhfSq+wPLjyyucPpoJcrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857076; c=relaxed/simple;
	bh=j8C2e6tDckdTRfkOURaqEkwk7kmVI0oyt3RA3Hwp+uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNd8Bo1+vUojSm6iZVz1rgLa0/vQvBCv8+WQwjzF5Fgn3Uwr73lnlV0wbZF0jek9Ue8EpSPH9AhidGvy/6KeO32kleQ5cp48wWQvZLvbHLP7ntuoHkUg3IPGgrCQkj/UWVatInmh4RZl4moLtd0J1oaItrrnsvt2BeGbYX+N6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdrpuFgG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdrpuFgG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2363e973db1so8376855ad.0;
        Wed, 25 Jun 2025 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750857074; x=1751461874; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pINmzrGfM7W/3B9anyGB+QhxgI2dWFZ69bm3f0khYUI=;
        b=mdrpuFgGJJGA6TQkUtweiw5NkxOABpGpjP2rYDl0/eMNflyc8HI+uOi+CDX9RLp+P1
         6VDxrm9UrHeuLnqbaMGoJ2TkU5Z2nj3GFXRS4+lq+4zNvHbxlwg1GORquijfNP2NvEiD
         ltvb7kcRRkkMtc6ni0oF1w+m1LkcZlwoCkpuYyujXnAe/TmacYEt9EyYBjSeBXFuf3oA
         QhTzq/I0FAAh2YQNOzPAVhlm65XbR8eRik1rsa6+X9/HgPbVMP+6atlssi0el9Ha1Vws
         LuGWsEcXxtfDaQvepkrlDUQKNHoqGuqTwYFpyKt+7YP/9C/SbZH9Fq3B83nQo4XZO+Rd
         +G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857074; x=1751461874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pINmzrGfM7W/3B9anyGB+QhxgI2dWFZ69bm3f0khYUI=;
        b=jyElNzbH5sYscs3qN1AwDlJkugjECQmRL8fWsgcpcYeOnUz6ljRTJkTEPi2TXdJ9of
         jO4Ovq6fC6F1egwzo3bYc2fC/pvtTVYJCvuXSYa4Qd7d8cO6LUE/JOTNLBsc1EdKI+lI
         WMhTyYa+1BW4dFDuTrOm7lhanRe4L93U24Kv/evuVeXkIiI+vaGzm0Q7c4el/Kdmn2fO
         dh1i6KfsSxeQsKYcpF1FS4XUAtjHzRJX4brlE+z/VGcne2IcTYH91ykeqMDPS2BXWZiK
         gzHrGcfWtf2YJzxpMsH1ju5aqrz8IF8zshf1vY0a2yZOFJZ/C6XqOSjCCpouqkTLcN94
         r/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV0khw1YQcU8Z1uT8hkfTDoBB94wRBMMHc7zhZfqum756ie0kzkuW+OANHS46DTLlDA5C9AoESQN+2/@vger.kernel.org, AJvYcCVCamQHF7x7JXcpQ2h7rtydTVypladjViJ15zvoV7Mm8QWFPQV8KuJWwU8lnowSG/GKknNrLDIB3SpWtTDk@vger.kernel.org, AJvYcCVMY1eLVWza1lABvFOH8lmIxFvcu12We3xWRcP+Px+Y/m0d3QfnDDf4H8Veuu2eGiAYFPCNbb7mDKeUzcY=@vger.kernel.org, AJvYcCXoGW8+rzcuoDEWZlpNSCaPgZAUgw66aLMNNc4TWja48zR/H5e+Tx4HZ0vVlEJ69yF42gz3bvOaq9lv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+fUbOmah72nEQV4GnqgxPpE9klFBn0+72bMFfn3warsRkfGA0
	kIGx0nlt49gUnn9MYJI6DpGmC0uAUQiVfhQ0jIRZyYlag5Ia+X1InWra
X-Gm-Gg: ASbGncueERItYGfptAeNePxTZDfl+Kc5KKm3kiSYEbVzxsL71v6g9pomOqx4M7nFwOo
	TngfqlozJZv0ow4cHsSjQoADqjwLUtlsJhr4KLzOJIybGxPkSVdXzejbKDzzuk8OJkCDDFl8zEe
	QUBHVNmQCA8wteRDlLz7le2hNvHUkfZGQIvBP7xfyTu3tweGN0xcosN8p15N5ilVJS9xTiMDKv7
	Ik3ad2mRi4qrRnCfQ4z5mQ/DbyDZ39Z9psk+iGLQvqIqC1kQe7gtrRPn+7I7qzHswtaMIaMU/jd
	RbBMeJl6qBWablywo4BeB6dOPw+SoOaPmvZYo/M8YVAqknNnR2NSTAQ+dzAm2FZHGSbb94tdAxA
	=
X-Google-Smtp-Source: AGHT+IGFwa6G2iKD65nivo9JPbJnbMdbeBIL5HNDz82Jr9/nArUgZKtC6neqtfHGwF4oRip87mYzHQ==
X-Received: by 2002:a17:902:fc46:b0:234:b445:3f31 with SMTP id d9443c01a7336-238024b07b2mr133494025ad.17.1750857073974;
        Wed, 25 Jun 2025 06:11:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839325fsm131346655ad.47.2025.06.25.06.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:11:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Jun 2025 06:11:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?utf-8?B?5ZCz5qKT6LGq?= <tzuhao.wtmh@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Henry Wu <Henry_Wu@quantatw.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Alex Vdovydchenko <xzeol@yahoo.com>,
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	Nuno Sa <nuno.sa@analog.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (pmbus) Add support for MPS multi-phase
 mp2869a/mp29612a controllers
Message-ID: <331d77c4-fa53-4d3b-a17e-22481bf72d32@roeck-us.net>
References: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
 <9bd05709-7702-4b74-85e1-3df25b57c535@kernel.org>
 <CAL3H=v3s6H4ZpnS=EhPrpEiu-9N-xFCkunHuwWW0xnkXbzY9Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL3H=v3s6H4ZpnS=EhPrpEiu-9N-xFCkunHuwWW0xnkXbzY9Kg@mail.gmail.com>

On Wed, Jun 25, 2025 at 02:31:02PM +0800, 吳梓豪 wrote:
> Krzysztof Kozlowski <krzk@kernel.org> 於 2025年6月24日 週二 下午3:48寫道：
> >
> > On 24/06/2025 09:41, tzuhao.wtmh@gmail.com wrote:
> > > +static int
> > > +MP2869A_read_byte_data(struct i2c_client *client, int page, int reg)
> > > +{
> > > +     switch (reg) {
> > > +     case PMBUS_VOUT_MODE:
> > > +             /* Enforce VOUT direct format. */
> > > +             return PB_VOUT_MODE_DIRECT;
> > > +     default:
> > > +             return -ENODATA;
> > > +     }
> > > +}
> > > +
> > > +static int
> > > +MP2869A_identify_vout_format(struct i2c_client *client,
> >
> > Use Linux coding style, so lowercase for variables, types and functions.
> > Everywhere (except when coding style tells you different, so please read
> > it).
> >
> > > +                         struct MP2869A_data *data)
> > > +{
> > > +     int i, ret;
> > > +
> > > +     for (i = 0; i < data->info.pages; i++) {
> > > +             ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             ret = i2c_smbus_read_word_data(client, MP2869A_VOUT_MODE);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             switch (ret & MP2869A_VOUT_MODE_MASK) {
> > > +             case MP2869A_VOUT_MODE_VID:
> > > +                     data->vout_format[i] = vid;
> > > +                     break;
> > > +             default:
> > > +             return -EINVAL;
> > > +             }
> > > +             }
> >
> > Messed indentation in multiple places.
> >
> > > +     return 0;
> > > +}
> > > +
> > > +static struct pmbus_driver_info MP2869A_info = {
> >
> > This is const.
> Since info will be modified by mp2869a_read_vout at runtime, I chose
> not to make it constant

That is a no-go. There can be multiple instances of the chip in a system,
each requiring its own info data structure. If the structure is modified
at runtime it needs to be copied first.

Guenter
