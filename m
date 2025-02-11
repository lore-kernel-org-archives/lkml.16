Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C471EF096
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279908; cv=none; b=cSfshF9APhjiHkAN8/Yq58asYfdBXi8jvfaIpNLBiYhxxGno99X+8JP9oQ/+zmyzhXfjQ6N2X6WUVcg4S+zzgW9BwHxgBwTVwkYmEGHztY5PGU1bVt0a4GMr7+owj2A8A0GE4a0Fwt4kiJ3gaRmu1SDUyrud+n6NPUXhbFFFQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279908; c=relaxed/simple;
	bh=sOdzvUj4MMT9zxUfUJkqXakEoGQ9CVufcBrdC+1LLqU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YycEi0jkcZyiA+ialqO2elpKEe789pGwDSqZNif3sS9pVvLrC/8MbVW1PUCrMy55HZ5TfLKf6+OEtrMnPyHtz7mBactipcG7uqwXQakL8N3BbGLnfaHetvGjprr57NC/NWkj7xUrw6X0uDhb1TLi7qd0BmpWlZo2Bp1yrvsdVd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lRypKdS+; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lRypKdS+"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739279902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOdzvUj4MMT9zxUfUJkqXakEoGQ9CVufcBrdC+1LLqU=;
	b=lRypKdS+Lu1mAGTHjlzCKz74VYgItBEALnpxTr1eNGBc5adKk+eKPE78HfVPwqFKBW7V9/
	ffFVFNYiBPAp0uxRDJesf599D5HU03DU70wKc/s54XPTzoRsujoGZPTPWCBS6E7Ny4UHuG
	KiZNZK4L8n89HHDkEgI/7ZGmkF327pw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [RESEND PATCH v2] params: Annotate struct module_param_attrs with
 __counted_by()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CBE23F82-A597-4DC5-A297-26F8DEFA07B0@linux.dev>
Date: Tue, 11 Feb 2025 14:18:08 +0100
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF59E5FB-5998-4BD8-9E51-6B52198638CA@linux.dev>
References: <20250114214956.915982-2-thorsten.blum@linux.dev>
 <CBE23F82-A597-4DC5-A297-26F8DEFA07B0@linux.dev>
To: Luis Chamberlain <mcgrof@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 4. Feb 2025, at 17:44, Thorsten Blum wrote:
> On 14. Jan 2025, at 22:49, Thorsten Blum wrote:
>> Add the __counted_by compiler attribute to the flexible array member
>> attrs to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
>> CONFIG_FORTIFY_SOURCE.
>>=20
>> Increment num before adding a new param_attribute to the attrs array =
and
>> adjust the array index accordingly. Increment num immediately after =
the
>> first reallocation such that the reallocation for the NULL terminator
>> only needs to add 1 (instead of 2) to mk->mp->num.
>>=20
>> Use struct_size() instead of manually calculating the size for the
>> reallocation.
>>=20
>> Use krealloc_array() for the additional NULL terminator.
>=20
> Hi, could someone please take another look at this?
>=20
> It was already applied to modules-next in August 2024, but dropped
> shortly after because of a Clang issue:
>=20
> https://lore.kernel.org/all/20241029140036.577804-1-kernel@jfarr.cc
>=20
> The Clang issue has been fixed for a while and this patch could be
> applied again.

Hi Luis,

you already applied this to modules-next in September of last year [1].
Could you apply it again now that the Clang issue has been fixed?

Thanks,
Thorsten

[1] =
https://lore.kernel.org/linux-kernel/ZuHaiiMV6ESS8p7z@bombadil.infradead.o=
rg/=
