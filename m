Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DE2E339C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537115; cv=none; b=Qwk8YkvOVvD6/jqqEz4ijQMhjeIhJATqanbbtAjJyqUfIIsrZ7uhFVQ7NMGh/cug6JGZiwF7ndYnYvn9qwJhfIVsFrKI2lHeSjXE6460U3F1UORNzcqB/iv0N6GoxRcSCHMLme9zK80NI7Bv/M6f+DoODPAcaGB9wU0r8U4lDtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537115; c=relaxed/simple;
	bh=7oeTHiTKmmTEMpzlxruE31hYes2XGUrolscSsAD6HUg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=q9cUawNUkqwEwkC/P8wglEpqk4tm3zp4hiDmV8IKUhlfhLzaBmE8S7KkZh0g/AhRcBOUIUjsRyYis4iKwiWqlcPKlRLoJLe/EDqvpEQonTYc310SfLeYtHbThyAz4NSZHp7G/PwrhC0NvG5Imkx90aXCQT+X4wK5dq9YqpsXD0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kFyU7slN; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kFyU7slN"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743537100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZzfmpSBUWlgmMuvl2RFbweDlXEH/+tHHYq+lHJwlh4o=;
	b=kFyU7slNlcxXI11fLgeRb/XJvMpDwnLjU7OAZGh5LbYWJCmBtrCGW6ZOpqzrs2zPp6qJva
	g37Kd7YyrSOmH0O1AfcmGjiJyLx9B9Q2yiaRbovAqwCYZ2nIEOMREovcPKEUGaIleX5t6t
	+Sy7PGN71vEgaucKO38qdxuorIXuZvU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination
 checks
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
Date: Tue, 1 Apr 2025 21:51:27 +0200
Cc: Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
 <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
To: Alex Elder <elder@ieee.org>
X-Migadu-Flow: FLOW_OUT

On 1. Apr 2025, at 01:31, Alex Elder wrote:
> On 3/31/25 1:39 PM, Thorsten Blum wrote:
>> @@ -125,16 +125,6 @@ static int =
fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>>    	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>>  -	/*
>> -	 * The firmware-tag should be NULL terminated, otherwise throw =
error but
>> -	 * don't fail.
>> -	 */
>> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] !=3D =
'\0') {
>> -		dev_err(fw_mgmt->parent,
>> -			"fw-version: firmware-tag is not NULL =
terminated\n");
>> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] =3D =
'\0';
>> -	}
>=20
> Interesting this didn't return an error, while others below did.

Should I keep it that way when checking for a truncated firmware tag or
should this also fail like the others?

Thanks,
Thorsten

