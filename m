Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E11F4CBA;
	Thu,  3 Apr 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677003; cv=none; b=rd+YoThzhzvB2OkCKnjQPLDts+OSO6VArFlQl6om9wGWcuOICkplTASj30qrv4b3uLxtYXKtMAmwdG/F82RPZ9oCfFphghFGAXxpcCit8EfNJPOeXuWK826ZAcSskydBdixQD9AdysHnrUxZuzcqRPt5N0BkdVlu0FseihJbqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677003; c=relaxed/simple;
	bh=p93/h1wDmzIvQYMtd1e2S0tusiJpTbOHIT+ut/erzaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oXtJvTk8OmlmIXoPC0z9OK6XFZmZt/LuMJVSukvQ0JbzoZ5/bu2HjW5QOG238ZiTcOKpJJ5m2IUrHSpaf0gycbk5Ke9kZAYXGInAZ3PDqdNZbRYs0UOtY+n5Fl6vXAapu1Vde2DjSpuK6kFDxh2Md0ihPxd5DyM5RXb3r26x+xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=J8DfOQ1G; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="J8DfOQ1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743676994;
	bh=HeWpKwZIi1vJa4eCTpI3g5nUVCNkZ//qHa1e+CfjGGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J8DfOQ1Gey4ELVU27V1LwNyUkoHTiTW8nJQYLJYSnEKVmU3RKR6ITBla/PcVZeldG
	 GZybylMvPp/8K0u0nO0DVimdA2DgevRs0aL15fV5d6llQ/pUCV+xhIaO3H/O+v6x5P
	 tyrBkXZibqvI5IVxQpz5qHd7IxGImQi4k54wL5olvw6aGYZzaWwhnDodgH2ULjjbR1
	 S/jEMUSotjGOa2JD2GNZ3CVuFIj+eBMaZ9/JqOkC6iC6GBWxysUM9iq2s/SGRm2iBV
	 dMcZ5Rkckea1Ul0D+d0Kooz0+Dr2eby9skO/9CSwimN0PEmV+RIRmgF/H/E/OJg8vY
	 w9l5zCXavbqPA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A3BE27B352;
	Thu,  3 Apr 2025 18:43:13 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20250401231001.3202669-1-william@wkennington.com>
References: <20250401231001.3202669-1-william@wkennington.com>
Subject: Re: [PATCH v2] ARM: dts nuvoton: Add EDAC node
Message-Id: <174367699833.3146674.17448098889682060142.b4-ty@codeconstruct.com.au>
Date: Thu, 03 Apr 2025 21:13:18 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 01 Apr 2025 16:10:01 -0700, William A. Kennington III wrote:
> We have the driver support code, now we just need to expose the device
> node which can export the EDAC properties for the system memory
> controller. Tested on real hardware to verify that error counters show
> up.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

