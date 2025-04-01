Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA71E51EE;
	Tue,  1 Apr 2025 22:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546815; cv=none; b=DiUt3abRuUVlbLdGJIuIOzd3JdjQuI+gw8xDhZwqJKbG63MOeuXup6zbaIAyTKh82liH5eXTyowxG08lcFoZHx+k3UbN7jXKUiaWO6xvC8crhSrm5ipNj24N4y9TFHmNxZRGxF0bVL55IXpiBImvy3zHx+RUbRx957zwIeJmzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546815; c=relaxed/simple;
	bh=CH7MqcZV2VBOzZ/8t0gH4zGk7jwA+yn/NUMsuwf04qg=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=mpxxfKZ9WAgVuBJ0FsjvKbdv/5E46dcmxgzvAib+lkys2DBP73Yh9mdn4N+QOCTYkP09t9NbVjLPHDrABhSsUCm152YmVYPD2wi5WCLASHNBtUFdFmuIt2P8H7ZD1MXPIp5+UjKM6fYd+2OAZu5nKVgv1E6Y8cSOvJW38VP5u9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com; spf=pass smtp.mailfrom=savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=l8i6Yauv; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="l8i6Yauv"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 04D219C8CB6;
	Tue,  1 Apr 2025 18:33:31 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id vkn1NeYYd9EP; Tue,  1 Apr 2025 18:33:30 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A0A479C8CB7;
	Tue,  1 Apr 2025 18:33:30 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A0A479C8CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1743546810; bh=CH7MqcZV2VBOzZ/8t0gH4zGk7jwA+yn/NUMsuwf04qg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=l8i6YauvPQ2i0LgvvpvPKuhDfgHOeXGnCK+/josnomZfko1Y57u4+dgsi2QydlL+B
	 +HjzW2qo25pZcVcx92Sde0e7uJMlNAxBovGbKBcq/66YRn+u0S8krS+y5qbASqGliL
	 2M3mC3JuB68P8kMOsojdSd8oBK1cFnLAY9NWygo9oPJgxxi52HM9yKWpbUKRyYMWNv
	 zVUB7mtQjvv+B30ftMxib7Xvz68HD77AbMwQKrbDU/bnVMGzPzjNTQf5yz/JMZvKkq
	 jNDlFPXS1TtrApnXvccWZWV806sPAfvVmmh94oj97x6MdBOvMi7+DT3dH1NB1a0UcD
	 oRa+Us4khCgXA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id mzthgnVnUiNY; Tue,  1 Apr 2025 18:33:30 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7A6899C8CB6;
	Tue,  1 Apr 2025 18:33:30 -0400 (EDT)
Date: Tue, 1 Apr 2025 18:33:30 -0400 (EDT)
From: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
To: abdelalkuor@geotab.com
Cc: heikki krogerus <heikki.krogerus@linux.intel.com>, 
	gregkh@linuxfoundation.org, 
	javier carrasco <javier.carrasco@wolfvision.net>, 
	harshit m mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	sebastian reichel <sebastian.reichel@collabora.com>, 
	hdegoede@redhat.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Message-ID: <2144507234.59753.1743546810454.JavaMail.zimbra@savoirfairelinux.com>
Subject: USB: typec: TPS25750D dts validation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 10.1.1_GA_0424 (ZimbraWebClient - FF136 (Linux)/10.1.1_GA_0424)
Thread-Index: gj9dQiokSIMXkY59+xACAJ7B+QQ8sQ==
Thread-Topic: typec: TPS25750D dts validation

Hi Abdel,

Please could you share a working dts sample with the connector/usb pair for the
TPS25750.

Did you test it with the data-role in "device" mode?

Kind Regards,

Samuel Kayode
