Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF583D76;
	Fri, 23 May 2025 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983226; cv=none; b=X4keeHJgeBN2cixpk9zFOZHbs2mStFvqTG1i4PmECNI/amhaKemQ5V79uoCpZCzVPABjjYg+46CiIvS3352JHxvDp//GZfcZFrOC6qO1ULZamrZ+djxj+5MYRnUuZ8wuJ4kc2+DpqqX+k3NfzggfbNWRU9BYYxkG9m5TF8UNrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983226; c=relaxed/simple;
	bh=Lsb28yKdk8vyGwqP8iZ/Q6QHZLyZHq6niWOgOaZE1q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBd6MioDrJWplLzt3JNBnC4BlYk4YZ799zdd1JMJ0osLtckpJQJbqONPbOJtYt4fg7rBxr3Beuljga4DwTSDrtVekAGTMOTjK/MK1lYNf4GFrTa9SNemg8CmbxpqiWWodB7YdHWmzilhcFbGe6/oK3yGnQAR3dDak1KsCk2aYKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uv54D9nP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uv54D9nP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE77C4CEE9;
	Fri, 23 May 2025 06:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747983225;
	bh=Lsb28yKdk8vyGwqP8iZ/Q6QHZLyZHq6niWOgOaZE1q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uv54D9nPQDfnIIRncbE3cTRHaSvzQwBUqi0NX4cMjEh/EO618H38oHMM8mvzxx2r2
	 Cm5lr0Jo1izbMhu+KqqRb8miwGlgj2RC+bOwdC8Y7WrG1qDvfSlRCKzXIEZ4L7VTCp
	 x3rojt3dyvFEkmL+FMYCk2RLOOwDs43LwoRTOb7myrT1ozbFpvEiJ+hhWJWwSTyC+F
	 FBtAAturVlWME7xcM7ThHmzz4/Xp6oE8PT+lJUQyZUz0OprtvTrsDGNyH+jDPA6y/3
	 X5ovza5f3Ui1ZytKCU8bTHFdjaz2VG8NTr9U2k0AZnutxjZgwSRRVt/MBC8vn/NXEi
	 pjEz/HNNiZQlg==
Date: Fri, 23 May 2025 08:53:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: add bindings for NXP PCA9450 PMIC
Message-ID: <20250523-peach-tortoise-of-stamina-1a01da@kuoka>
References: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
 <20250522192325.1099680-2-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522192325.1099680-2-martijn.de.gouw@prodrive-technologies.com>

On Thu, May 22, 2025 at 09:23:23PM GMT, Martijn de Gouw wrote:
> Add bindings for the NXP PCA9450 PMIC
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>

This belongs to the binding patch. Headers always come with the binding.

> ---
>  .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/regulator/nxp,pca9450-regulator.h

Best regards,
Krzysztof

