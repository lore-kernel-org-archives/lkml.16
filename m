Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8C253928;
	Tue, 20 May 2025 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774775; cv=none; b=FPNEY4nQIsdrRMNoLlX9SY/3G+mo/u3uIQ0ZySI8TY3Cogo74/8DeTcsjrVdOgZs6vjvYD/T0L41wYBQQh0DvfwsoTgI7tjUqB5QluPw5Q2CAxEknIlCmh57tg5afCRVYefvu6lFeZ/Eu25wx8SgyhuEV4yPAu7KuooWzz41TOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774775; c=relaxed/simple;
	bh=HMFGC54+xi7z1x3xlo+6y1gcFl4iD/khkQKV23/T9MY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q51WjxY3hWfbLvAbQNNSchIzKIjNc+70nvSbLzErqAp6ruOEuU+0GdSHmIUnIzCcmMDj04Ty0nta2B9aqhdToS79UNrAQJ44btiBKs2R5f32fticMFcaLBo6bMQ0Ux4F1yAxy/BJMTaNyWyKqjPK2Pg/gFocF4Y9q+wsZk4pqyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEAL58v7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEAL58v7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747774773; x=1779310773;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=HMFGC54+xi7z1x3xlo+6y1gcFl4iD/khkQKV23/T9MY=;
  b=XEAL58v7QKBHIhZsfnrN4C99qFZLgE34c3R/CA9n/X9AxVX4n83xG6Ba
   Zli9Fzx1KNNI6C2pY7q8vxKwaK/nkH91R4uOehFBXg1Lvx9HaGKYXVggt
   QSCuaPdVstoqw9O6xeMrAbTv1PyzM3xWbbO9H/XhvOvk+X/KaO/9b4iNU
   Y19iFNr36LNo89nIgNJjkWrkkn1y3JXeeH+MOtH0JDwbcolYqqrevDmU4
   85FfwXcsd7HK4Rb+XgLdg1ShkMhhk8DhjOfQGzOYnQ+ooCqiTYLOyYvcA
   ZtrIbYK2QoostjzklIDOjKTM94qiuZvu07suuZy97N/iETjDZfBttH4Gf
   g==;
X-CSE-ConnectionGUID: RrnpK0RVSCOQ6297ulDRVQ==
X-CSE-MsgGUID: y47BXB+zQJGpxFfbtk6VyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67142691"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67142691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 13:59:31 -0700
X-CSE-ConnectionGUID: j5hEzU2hQZGhV41b0JmFXQ==
X-CSE-MsgGUID: Q3FcPjtQQ6eZ8CMFEBjPxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139850866"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 13:59:31 -0700
Received: from [10.54.75.26] (debox1-desk1.jf.intel.com [10.54.75.26])
	by linux.intel.com (Postfix) with ESMTP id C8AB520B5736;
	Tue, 20 May 2025 13:59:30 -0700 (PDT)
Message-ID: <43b6f7e95a4ca1ff34798c668731a85178b15474.camel@linux.intel.com>
Subject: Re: [PATCH 08/15] platform/x86/intel/pmt: Add PMT Discovery driver
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, 	srinivas.pandruvada@linux.intel.com,
 Andy Shevchenko	 <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
	xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Date: Tue, 20 May 2025 13:59:30 -0700
In-Reply-To: <2caddb52-dc05-a589-e7d7-de4035e5c803@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
	 <20250430212106.369208-9-david.e.box@linux.intel.com>
	 <2caddb52-dc05-a589-e7d7-de4035e5c803@linux.intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-20 at 17:32 +0300, Ilpo J=C3=A4rvinen wrote:
> On Wed, 30 Apr 2025, David E. Box wrote:

...

> > +/* Get the discovery table and use it to get the feature table */
> > +static int pmt_features_discovery(struct pmt_features_priv *priv,
> > +				=C2=A0 struct feature *feature,
> > +				=C2=A0 struct intel_vsec_device *ivdev,
> > +				=C2=A0 int idx)
> > +{
> > +	struct feature_discovery_table disc_tbl =3D {}; /* For static
> > analyzers */
>=20
> I suppose you meant the initialization is for static analyzers but that's=
=20
> not what the comment now reads.

I'll change it to say "Zero-init to avoid false positives in static analysi=
s
tools"

Ack on the other comments. Thanks.

David
