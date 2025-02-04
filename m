Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC5A15689A;
	Tue,  4 Feb 2025 03:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738640603; cv=none; b=csfjFz/cIjGfBOIrVNAeB+WSL+KGA81GNzP2nD1x0A1vwcA5LvYdWolbjxniyDS6GL8XlRxW8QkFeOhqF44CDTbwqnhkBWHZyWXz1J45+ZdY4UDwYI8AMWuJSFPYaERFsIKwYKI5JjAbYvC9k+KlBCkXYM5qMGHYAezELOUJqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738640603; c=relaxed/simple;
	bh=ToAtU8U8ya+XHoeO3XNmrlkp4dyLKZzbpPN5r/Wq9c4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lNTKewu1Jycq1+FNtU7VsyJ9xR9Y5T8Q/BNRRCR+CIMSkVZeCRSU/IUGCofnKe4REqjpUkTnLpg9hSLlg+GjIJmFTj7N0C09unZKN4crZRD6iA34rtKf9JVwA6DdbTVg1dpNdkybCu+ElpuSdU6NpTpwSvsFRtD5UGoI0IhXS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrkRnDrp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrkRnDrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738640601; x=1770176601;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ToAtU8U8ya+XHoeO3XNmrlkp4dyLKZzbpPN5r/Wq9c4=;
  b=JrkRnDrp0c2J2E74mKNokK5yRBZ0wWlvdtyiQLIDk5LB8m/9ynRsvp3o
   tHpUBVOLlv1+5LCgckO0MvJYtUXkHoI5Ce3zlWXWwRB+y3hirShWwjnOY
   PKbaFbAv5y/f3fCYW2QsAEHHEn3m3nFTNQbOmCgWKY7Or3BYtp29xGw8F
   Rvt7vOopt1PbFBudzk30X9hzusd+LLCfa13HexwbOzKeBoKn6LEp3geU0
   iwfyTFBJDddyvGs7i7e0wsMyXLfzlsHvNV4aenQuyV3+qpBylIwnIPRFa
   0pErjZMcraRagtMicBMSZFOeruiZuhStMsM/Svl8Qr5izuMAwuoShSh/9
   w==;
X-CSE-ConnectionGUID: WHJzpYBBSCypeYIl/LAx6w==
X-CSE-MsgGUID: UeZS7ikETyC2GBZ3kQEn0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49408366"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="49408366"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:43:21 -0800
X-CSE-ConnectionGUID: FYnDBlLpStW7Fy0o7g4oYg==
X-CSE-MsgGUID: mNtssUBgTVeyTlbPHnJKAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110363701"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:43:18 -0800
Message-ID: <f5b4881928e3395eee9b6e6a4fb89f3d605cfd2e.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Prefix header
 search path with sysroot
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Len Brown <len.brown@intel.com>
Date: Mon, 03 Feb 2025 19:43:17 -0800
In-Reply-To: <20250129033932.2576077-1-raj.khem@gmail.com>
References: <20250129033932.2576077-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-01-28 at 19:39 -0800, Khem Raj wrote:
> This helps when using a cross-compiler for building intel-speed-
> select,
> currently, its hardcoded to pick libnl3 headers from build host which
> may
> not be same as build target when cross compiling.
>=20
> cc -print-sysroot will print nothing if compiler is configured
> without
> a sysroot and result in same string as it is now.
>=20
> Fixes errors with gcc configured with host include poisoning e.g.
>=20
> cc1: error: include location "/usr/include/libnl3" is unsafe for
> cross-compilation [-Werror=3Dpoison-system-directories]
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Len Brown <len.brown@intel.com>

Thanks. will take for the next release.

-Srinivas

> ---
> =C2=A0tools/power/x86/intel-speed-select/Makefile | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/power/x86/intel-speed-select/Makefile
> b/tools/power/x86/intel-speed-select/Makefile
> index 7221f2f55e8b..8d3a02a20f3d 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -13,7 +13,7 @@ endif
> =C2=A0# Do not use make's built-in rules
> =C2=A0# (this improves performance and avoids hard-to-debug behaviour);
> =C2=A0MAKEFLAGS +=3D -r
> -override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include -
> I/usr/include/libnl3
> +override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include -
> I$(shell $(CC) -print-sysroot)/usr/include/libnl3
> =C2=A0override LDFLAGS +=3D -lnl-genl-3 -lnl-3
> =C2=A0
> =C2=A0ALL_TARGETS :=3D intel-speed-select

