Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37DE19AD5C;
	Wed,  7 May 2025 02:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746585558; cv=none; b=N9SQAvNf7/GSIB3MdCqjalxTcvDpHZkKBV0L3utuIhwjByO+fE6DiLNCWvTuNVzg6n9LEX+Yx8JgLwpCqPVNL+9h+q0uqpUDHZvAec3rlJE7uDFkUwH/aRUufoWN1JC9K1eHH91xlIC/z3TOq+00IXaKnJZjzYVHb8z7ou6EcZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746585558; c=relaxed/simple;
	bh=mYzVdCxb05r5IV1qxjq+fLxj+ckGAC7t6/gKEWdHZbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WG8DiGrHFe+sIOHHb2WlIptdUPp2AMA5IlawbR+e0fG1S1yGuL/A6bg0xWbX3kEtt6EPwtTer7hz4SwnBoheREyTNbEI4uNrHdkyd7R3AbDsXX9jQtwA62E5QLH/Df9LuIEoG291cqjzWckQLDgUG98rXRW/m0ESdnhgpgpH81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=MbtsnBpi; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="MbtsnBpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746585553;
	bh=BW9Mbotb7DptqVa6zP9NiVBowm1eZRCpQ6q2nbVAePY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MbtsnBpiO3vYwGBeF6POnqBj+HSq90yXnHnMY2WUNK2+Gqbi9YpI1kKLtMG9A6kik
	 qT7t0rnJpkVt/3QE8JvXP34geWKX5fU9gKxe4KfbIfV0aca03l9Aw0oyOX7N++k9WM
	 mV9sDstUxraScv5Ve28OVRcCAcE9nRgEm9SNBFyKWSQJgb6OmIqT1FRt4Q3lxTpDfu
	 OaIjWyibxDqtyxu9B0IbxYLoJPLW1OA9FaxevolKR95oVd5VYkJibuZ6yVaIiE/G4e
	 Dt7XWx+/vP6mTmugUl7pB20aMviKBR6lyE8J1vdgbo2NxEc2ITNwX+YWzoqsfc5dj2
	 3FbnylinI35xA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2DC6A64473;
	Wed,  7 May 2025 10:39:12 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250416015902.2091251-1-william@wkennington.com>
References: <20250416015902.2091251-1-william@wkennington.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add pinctrl
Message-Id: <174658555212.2363912.15584445504922514625.b4-ty@codeconstruct.com.au>
Date: Wed, 07 May 2025 12:09:12 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 15 Apr 2025 18:59:02 -0700, William A. Kennington III wrote:
> This is critical to support multifunction pins shared between devices as
> well as generic GPIOs.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

