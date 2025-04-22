Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF578283C9E;
	Tue, 22 Apr 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328687; cv=none; b=qWTZd7b/NAsemBPAa+7SEtoXaXN63E4gyLbQ95F0zc78IZUcwG8G3uOT5Hx8xdnZ1CiK0BkLCWjfW3c4B31rZqSDUPNXJcGL0j+ZgU0nGG9QVVD96ckh6uvqNW1bgZaGJSWzpZPN9yRgbcfusXqLRQRx0DpcbWcelw0UzrSaejc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328687; c=relaxed/simple;
	bh=4frgR5/tnr8QJG6Tr4/8sDe5f2lbUd/nKC4g+AtXBcQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=i2pX38cVLB68rwcQxslhjnhhvNMeNrJYUqt04CeJoRRbVyfbJnSg96hx+Gd1E1GDr+tr7QltqPOmSVVkmkHggKAfeB3e4ZANQ8Jn8tYun4mYeVJL+fz5PdGw4ha/jvw7FaJ4GAfoMSYJC37QpIESLMkvFflFciNaJz6fvJODVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02975438A4;
	Tue, 22 Apr 2025 13:31:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1u7Dia-009l2h-0m;
	Tue, 22 Apr 2025 15:31:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Rob Herring <robh@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,  Guenter Roeck <linux@roeck-us.net>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Krzysztof Kozlowski <krzk@kernel.org>,
  linux-hwmon@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,tmp102: document optional V+
 supply property
References: <20250417180426.3872314-1-peter@korsgaard.com>
	<20250422132602.GA1092156-robh@kernel.org>
Date: Tue, 22 Apr 2025 15:31:20 +0200
In-Reply-To: <20250422132602.GA1092156-robh@kernel.org> (Rob Herring's message
	of "Tue, 22 Apr 2025 08:26:02 -0500")
Message-ID: <87a588b9w7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhephfdvieejveevfffhvdetkeevveehgeegvddugeetudehvdekgeevheeufedvfedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehjuggvlhhvrghrvgesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepk
 hhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: peter@korsgaard.com

>>>>> "Rob" == Rob Herring <robh@kernel.org> writes:

 > On Thu, Apr 17, 2025 at 08:04:25PM +0200, Peter Korsgaard wrote:
 >> TMP102 is powered by its V+ supply, document it. The property is called
 >> "vcc-supply" since the plus sign (+) is not a valid property character.

 > Wouldn't "vplus-supply" or "vp-supply" work?

It could, but gcc-supply is what we use for the very similar tmp108
binding, so I think it makes sense to use that here for consistency as
well:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=699383466851e3fb8284e1eefeed78ec30989b3b

-- 
Bye, Peter Korsgaard
