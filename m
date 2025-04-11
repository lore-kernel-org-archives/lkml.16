Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D309283689
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400722; cv=none; b=Vy4PIs0C8DcD1oTHmjTf1vMXqZjw3I5I2XLcmX5sCeEQao27zssu+b53Q1BTE0BJkq7VLLsbelK0cv0ql1ZtMyQ1JMJDdVCiyFH0+eOZpIaWYZ0yByUQVwHtoi6cAcNkOGMhZtg1e7tguj0ofTL4eHZlKKDp1clXemXCc5EmajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400722; c=relaxed/simple;
	bh=0k+RRSIshNmJjhWDP0sDhEaJ74DfqYYPE9poDNlKT+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUEydbJynmXUAy+nlbYqSpDZoFnIoET0c20JJURosUE9QiDqbq3x8/yWUgpEOyfLrsZ1BwTloviHjvjLssB6cEqxG8MM6V/IZdoZVO+UJOyERovQsWNsDDKghnqsiyP/KH24BJqGtA+eAEn90/Ls9CQkwF0GTRTB3XZxKhDTnrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D+XhEpOS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D+XhEpOS"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54963160818so2799467e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744400719; x=1745005519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxYbMPJ9/3WWUWhZ50uH3rQ7QOEKEgqBV9xF/3bzbaw=;
        b=D+XhEpOSTY2iRLZNvIyJdESthVk9ylxkqTJv7FokRICCYftCzTmK6xnJDojYwW89ji
         2AFg7ifCj9Veb3HJw873OFYIKlcMfUwFcfLXsp2HXhuitNezaqLNBx9+23vmpUuXzJDF
         ca90T4zKAs9ScilMaX8jACwZ2Mhsys399QeR8BUlMz18Lo2iclMaj0m6Lx72mjpYlKt0
         IXgJRRcRWK+9UTF/5UNRWF9lWXl68EAgpiNrsN5uxI+dEGhs1HdEZ9zBFtlaKhEkzmcC
         3nYCrj3X6NYHQ+cAsW5szj5GX+YQyRsmMSNEWT/iB29b9JyVms4Kg8IkxxE2Wd/7Up6f
         I76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400719; x=1745005519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxYbMPJ9/3WWUWhZ50uH3rQ7QOEKEgqBV9xF/3bzbaw=;
        b=QEORAZrGfNJQrARh27MWpXpNPGA1VoIpbqj60JSVKvzYdhzQQsEgNmoyrcfV/2sYQa
         4qZQwnrZnbERP62w8Iv7wAHG6vDmalowfcltK33CMxx5jm2QyR9sKtq22s4LKXIoDyVH
         kxYKV2I7lnLEhYsoQ32E3ifNPIgbX4fI9HUQXiYQFBSxaVUQAeuSQUn/BDe3zFkxCHkA
         mPhHirR5uaGIIA852zpHlR2qMiW4mSaK95YK1pO1xugCu7JO2U1ZrTK2lP5bdUHaqomZ
         gXLKoiOs4FG2F/lVODGgNfCZlhzhkenfTVaKsEq4rQefliWvr7Ka1sFrmRCZmkOGCjO3
         rzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMlDrFUwXxI1fCvc7yjm63v1FRqkpgm6e6AEiGGs+yzyjNxdCY/7YvomzGNMYfPgqe4OCFgKlO4/Wj9u4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWZN+mhRUZUfazm70V5j4ECC3VWa6y+q5G6qyWfZ+nrIsiCCy
	KJ2HnnoJSCfznn22+stpPUYOTCom/qacdlmfCgcJeTUvw4KhFvB+65Xlyx92shTD5uvgZtZw4Y2
	Utsi3xX9HVBapDLSbNUi82kCKsDBG8rRRT4Iw
X-Gm-Gg: ASbGncsdouj9qj0xpA3Orj+KBLtWF0Oh+j4O7c0Tt1npNqO7BYG2OApPocXLE0H+g+j
	tPk84/ee8/9p/s+uUANDhskJr6Wg5EsHRakVfP7V0ALA3NjPFDpCuPq4jmEQi6baWpYnIKTr3dT
	9sLwd+UrP/jBKzPDpX1GY/
X-Google-Smtp-Source: AGHT+IFQGifPI7ndsGleSodbkGXAUKIZ07u6ZNQvsjF+hIGRNgR8glp2xAOBfn6+WWgANIaxwBpEYzIsWHLxnZAfzB4=
X-Received: by 2002:a05:6512:1154:b0:549:55df:8af6 with SMTP id
 2adb3069b0e04-54d452d543amr1362508e87.53.1744400718920; Fri, 11 Apr 2025
 12:45:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
 <20250407232249.2317158-1-sean.anderson@linux.dev> <174438283512.3232416.2867703266953952359.robh@kernel.org>
In-Reply-To: <174438283512.3232416.2867703266953952359.robh@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 11 Apr 2025 12:44:42 -0700
X-Gm-Features: ATxdqUFdZE_uhkHLsbxiOOiN0d_S9dmu-M7D17wvEEtC9Aa85-uCx9f3jAHFoIs
Message-ID: <CAGETcx8FVb91mL-LYN2=7yJGMaVsadpe_WiMn=OkEjMEHdJU3g@mail.gmail.com>
Subject: Re: [net-next PATCH v2 14/14] of: property: Add device link support
 for PCS
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, devicetree@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, upstream@airoha.com, 
	Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Marangi <ansuelsmth@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 7:47=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Mon, 07 Apr 2025 19:22:49 -0400, Sean Anderson wrote:
> > This adds device link support for PCS devices, providing
> > better probe ordering.
> >
> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> > ---
> >
> > Changes in v2:
> > - Reorder pcs_handle to come before suffix props
> >
> >  drivers/of/property.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>

Reviewed-by: Saravana Kannan <saravanak@google.com>
