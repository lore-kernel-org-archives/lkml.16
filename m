Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F112149C7B;
	Sun, 15 Jun 2025 23:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750028788; cv=none; b=MKepNOfHc7CG/p3cW2XpmIpnr8TywWyAESPIlK3aBwVrWfmQZBbK5QW7LO5libW860KgoK6b9htFrzZhcY+Ll+Nr44lkLcmi/mPc4xwQvCWrfuSINIjMPgSnLN0BeYR9ab+xN2dkyakm5W9gJmaaaZhJxXVXjc8ep7ttWBmDmXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750028788; c=relaxed/simple;
	bh=LjYoU47YUuXgmkF9+yVp0gX/jwddNE4ckWkVHOqD/PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STdCUyuylGwvP2eQtGoQ7hh8NFOeFiDeYTj/gSjX12HW5Tkcr7DEmBlQQDmGVwUggxFEtyaZvyurB+Bkofpn6hdURgt9B+Vokxj9MsQgfk5OTm0gkU9Vf9cNXYBCwfekb+oGWPB90lYzk3okmUKifJZ/2NmVLqLnXdvZ9x0LfMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtwYI5kR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtwYI5kR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso3136093a91.2;
        Sun, 15 Jun 2025 16:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750028786; x=1750633586; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HX+wqj0/TCYMn7O+tlyf2EWUT7kpatDbqvCrk/ZL2Ww=;
        b=CtwYI5kR380kzBq/VrU3k794z/CCbFZ7ZUeSY8lkNHIyZSDZ0BzAlhMibmqT/8i+FR
         zNkNvFEVfg1XFwKJSXhWaIn0F+vGjz/XhSKJYSgfhePTg4DQft/116GL54AIIvMqyDpt
         1I0ZrNY57u04cKvitbZtfZjJeMcBlKQ+ulvTVylMzdqtX+6L0SbbT69gJ5in6DV+3RDF
         fohk+vaR0HmKoXrBshgzAUCWe4wT2OhgLH+bmLtSdcWW0CtOld7kfuXTBZKA5z+lor7R
         jjbmMyae3GEPyaEFyZFNgsRV9RITS+X8ENToC2ZOYTjAx+gKw3594K0kIdmVYbednK/Y
         WY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750028786; x=1750633586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HX+wqj0/TCYMn7O+tlyf2EWUT7kpatDbqvCrk/ZL2Ww=;
        b=TBP3JvB8rMjtBA698rEpmT9RIIwoDbW+e5J2X5Np+SimxC/upSRl+yfRJZkX+NbjpL
         4dGS8IyKJBqAzhiSD0hT67fCDDsiLPSTMunkKiPEzuDc7IkgafHzTuU+EzYRqjugUPvQ
         cmDnZLhKZ9zxqF8FuFesZA+JRfHIZZknO5PfvJSWMIkJXh4FF5cRKhcde6ZLv1XPREQ/
         YgKL/8uZnPYdN1FHYZUDR30tms9mBtPBfQq10Jmwp3mXbLeSkH0eqp9EqDpQjIR91QBO
         FIDWW+JiFxLMLqnaf9p1iOi/nye4ZXa6DCV/wY8fYnZX8qyDopCqRXR8BAzgf6aWEm3T
         dvRw==
X-Forwarded-Encrypted: i=1; AJvYcCVCGBlcDcLjoxHeMGJjII0W40havhyqavNqZnn35ezPOafcOxUiZ1rhOkQ64ZWzguC+8I3PeJoK8GQ0CjE=@vger.kernel.org, AJvYcCWQWavR79ElTLm7jFG4myiD9yKgAg5JE6pj/e26Kqup2NtPztBmQr8mIYQpbg5WqhYWSXBJWLrIprIZ@vger.kernel.org, AJvYcCXB0yYH3dX0DUcVvokbI1U4xRveGSrsfc+TuUpnwKu2pAbHN352jKHlmCyPnwlFUXdyvRxHQrjZnZryqBRi@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmHa31u6PiqRqgooGrXIdO9Q4k2x3RED4eGuCwmRmIhVizI8o
	P9zl4u1PlG+BW2ffenS4005eN+8gTmtdnB8pDMOBmQG/d2mVicldByHP
X-Gm-Gg: ASbGncvwZzaVtmAJZtz5t5mHw+9PQRm0fKL/HmKMT4Hd1+fw6EnLvF1q/ZUuHbVX0PN
	4GSA54YfKad45lrIsRgCYpJYlSUOQJ9fwk5xnZVdIof1h5HrRbfMplyl40Q4i1fBKcC1ylf5YgR
	JbrNWr6auAbZhc3AIWhaFU8xMVSm3YNKdyxmgSsqxKfirA2WXT1tSHjc2TZrMFGrSPM1gZAcbY3
	DMaOGywWNoUcOzgcyJlJpGYuy/dljtZTE6CvTxi9A+o2mA/yH/WqAu5lk/L3EqG89QXUt8t0gOl
	U5ALwy+Y1tI0YmPfBoSbgvlAXEIy3BkkOzHHdRVW2ErNlHT1fY5BLmk1jA6GOFl9Xl7aF72z664
	=
X-Google-Smtp-Source: AGHT+IHF4RCRc8VDpUa4zCZ2J2CqUn1DrZQzzWPw+pXrqO4DOtLrV14L59zCBTpjrxHWWfDkOFSFQw==
X-Received: by 2002:a17:90b:3b4e:b0:312:e618:bd53 with SMTP id 98e67ed59e1d1-313f1ce2b77mr8982701a91.26.1750028786393;
        Sun, 15 Jun 2025 16:06:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b595aesm8174728a91.35.2025.06.15.16.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:06:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 15 Jun 2025 16:06:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v4 2/3] hwmon: (amc6821) Move reading fan data from OF to
 a function
Message-ID: <bfca71d8-aea7-47ac-949e-c9a8baeb0193@roeck-us.net>
References: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
 <20250613-b4-amc6821-cooling-device-support-v4-2-a8fc063c55de@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613-b4-amc6821-cooling-device-support-v4-2-a8fc063c55de@toradex.com>

On Fri, Jun 13, 2025 at 10:42:39AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Move fan property reading from OF to a separate function. This keeps OF
> data handling separate from the code logic and makes it easier to add
> features like cooling device support that use the same fan node.
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied.

Thanks,
Guenter
