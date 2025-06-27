Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084CD171092;
	Fri, 27 Jun 2025 20:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056617; cv=none; b=E7vEB2CViaUGG008OJPd7DVEtvmfBs+cVms/2LqHqQ2yAIMNXWW4sYIuEGomXnN7guXG6miqrKxBHNybrBShYckzPQjXa++iRCI5ZFCYJEUkAMqi/KVmopvNp3H99lpK5p1FlwO1hQaTf+aUPiFXuxlL8K6Gzsgsjm4Z3goohgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056617; c=relaxed/simple;
	bh=qxYr4GkNyEMz/Smdf4p2vqNgb00Iz+tup5dPkYdZ95Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdNZpP+s7n/UoOcKLdz34ECQR452xaazRmwopKG61CKOPGIRslKLH6uWwct4KPmir8KliIU40SFggIzcno6E2R7g/XRh5Rtc9EBzImCJZsHs5/WASeDjUaRg+rcET1Q8h6hBx+rYzLWJ20hRY8OB4mMLFf65wu/ZuHF/NiIUiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQRo5Qdn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQRo5Qdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2C8C4CEE3;
	Fri, 27 Jun 2025 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056616;
	bh=qxYr4GkNyEMz/Smdf4p2vqNgb00Iz+tup5dPkYdZ95Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQRo5QdnBY2LfNw9m8t4c7E2pOB2VALFmeeE2/SBnAW4thoTdzwmuSVIfOPXSceiQ
	 PfX6LwXLORBNJkv2d0lB2vGOHVvvx+f91KU8dipL2lyWUBqtCie+UCgLVsLoGp+B+n
	 u4Wp1O9rhMoK7iG/JC/X4aL8Ui8pUOoAXyTMccJHDqmiuzV7lOGS/JnpivCYN/Cgvb
	 7y4my/H+7D98BzKqa6Fer3BsSq87Q9kY8RghRVdwFMrqrZUY0cJjqdTFbEHkPtZc+f
	 Z4G+nkaSQMZ/VPvKP0adoBetL5feHcynIP5eQ7dHOVr9Rs22S6K4zd6zt6ICHfIrDx
	 zgFkLy1A+lJWg==
Date: Fri, 27 Jun 2025 15:36:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: wenswang@yeah.net
Cc: corbet@lwn.net, cedricjustine.encarnacion@analog.com,
	johnerasmusmari.geronimo@analog.com, leo.yang.sy0@gmail.com,
	linux@weissschuh.net, naresh.solanki@9elements.com,
	festevam@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	xzeol@yahoo.com, jbrunet@baylibre.com,
	laurent.pinchart@ideasonboard.com, linux-hwmon@vger.kernel.org,
	Mariel.Tinaco@analog.com, grantpeltier93@gmail.com,
	ninad@linux.ibm.com, michal.simek@amd.com, conor+dt@kernel.org,
	kimseer.paller@analog.com, nuno.sa@analog.com,
	Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add MPS mp2869 series
Message-ID: <175105661522.41086.17889038565748312846.robh@kernel.org>
References: <20250625065956.964759-1-wenswang@yeah.net>
 <20250625070338.965168-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625070338.965168-1-wenswang@yeah.net>


On Wed, 25 Jun 2025 15:03:35 +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2869 series controller
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

