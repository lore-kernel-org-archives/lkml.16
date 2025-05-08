Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C61278173;
	Thu,  8 May 2025 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715812; cv=none; b=ZjL94g5jG6qSURCKXO+LYCd07AtVwklNqvHuS0J0A/WNf4Ng6aqhoj4WUEF591z/aefFz9oUbIAiXvet+9D+hX4Zfoe5DEKSwHHrVXSG3pbRPVq+GSbQicfTguDvSp95QG7yjPw53WWSaP8/ZKG8NwNIWNiT8i+hxGFbxg9Y6lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715812; c=relaxed/simple;
	bh=h5JXwZOrZjX1PiuoSkTRy/HM8infmDLDEeWmTc0QT+I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GeXNEIjYXDs5FkTY8JJZM2bmAsju2h5jbCEu0Fzp407xcwuikLKuQBrw1Z72xwyj7Zcx6EDmEfiLM9XKWA2u04+bpYayzgCkWOIQsWXgxY/HdHUIH8rQZx0QE1dtImkLFjOzlhyyEKvCcTW4q85D5ts92Fq9MzC5tYi4+E3gQsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSwf3JFO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSwf3JFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746715811; x=1778251811;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=h5JXwZOrZjX1PiuoSkTRy/HM8infmDLDEeWmTc0QT+I=;
  b=fSwf3JFOyZvtgk+PMYUex29plHDbggCRuXBM0YnCgsNKYiUEYZ7+IKiX
   8XP2zoGWHfW457L6GdH4DKNPy3pGj7+ZEnhesKPapmmvO9MmI20b/OqMc
   Aeb0iWuPBw1LH0wZhGeON/Ochb+0+GeGTg+ll5zuB8BFDdht2eWeDpCn8
   Er0fiYW0nqy0X2iZFlPkuHk23QY4Xp+j76hN/QDml54QcyzeIqHnK14DS
   2MOpW3jaUQarhNTFQUGKdByolw1H8W1bMz6yNZkJhvR+m9O/NA7kx1MjC
   BJSU9UCQP6FMfA8iSuIkDNP4YR4eLUc8C4HrTDkcwJClH/g022Sp6qouu
   A==;
X-CSE-ConnectionGUID: 35iQnzwWQ3W1+iIJ6FkciA==
X-CSE-MsgGUID: vKmsQEf3S5Cl8o9LFPmaHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73884241"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="73884241"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:50:09 -0700
X-CSE-ConnectionGUID: zXAHobs+Q6q9wnLF4V6+mg==
X-CSE-MsgGUID: G3Hb/OH3RYmzU02WnU80EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136270799"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:50:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 17:50:02 +0300 (EEST)
To: Lukas Bulwahn <lbulwahn@redhat.com>
cc: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: rectify file entry in DASHARO ACPI PLATFORM
 DRIVER
In-Reply-To: <20250507075214.36729-1-lukas.bulwahn@redhat.com>
Message-ID: <de8baa52-3d31-b3da-07ba-73bdbc3e8469@linux.intel.com>
References: <20250507075214.36729-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2101696879-1746613595=:949"
Content-ID: <d44eb777-e7a6-e946-8cfa-8a6f050dbc7c@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2101696879-1746613595=:949
Content-Type: text/plain; CHARSET=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <fb6249b1-c18b-b376-2862-7876133daee7@linux.intel.com>

On Wed, 7 May 2025, Lukas Bulwahn wrote:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit 2dd40523b7e2 ("platform/x86: Introduce dasharo-acpi platform
> driver") adds the platform driver drivers/platform/x86/dasharo-acpi.c and
> a new file entry referring to the non-existent file
> drivers/platform/x86/dasharo_acpi.c in section DASHARO ACPI PLATFORM DRIV=
ER
> rather than referring to the file added with this commit.
>=20
> Adjust the file reference to the intended file.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34a55e3ff863..82e7b053ea76 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6576,7 +6576,7 @@ DASHARO ACPI PLATFORM DRIVER
>  M:=09Micha=B3 Kope=E6 <michal.kopec@3mdeb.com>
>  S:=09Maintained
>  W:=09https://docs.dasharo.com/
> -F:=09drivers/platform/x86/dasharo_acpi.c
> +F:=09drivers/platform/x86/dasharo-acpi.c
> =20
>  DATA ACCESS MONITOR
>  M:=09SeongJae Park <sj@kernel.org>

I've folded this into the original commit.

--=20
 i.
--8323328-2101696879-1746613595=:949--
