Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAB1FC0B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746021075; cv=none; b=QHX2YrTO2Q0EjyZ/xOqmHZCmRRYb85mjvkZId1omkB674IcG19DB5LnLvIlE9Qz5G6gPIxKB9OGSwcYK8jwW75jnmgffcH6gyR76DHBw+gdFPT/8K5QoFZVIY15CKbYus00AUGtX2Lzg+Emy1jQ4qMkUJeAfa9WVASKYEDZoSbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746021075; c=relaxed/simple;
	bh=+ldYEvqb+hwZaur+5ZU3Vf/BQL2XMqQNtO4hKxG/Pr4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nakkc567yXQOCtxdxn0uYKPYusoWjFdfXDGgmP+5jxjfBinPvvKNXVFQzVq9RmVc7nQCM+QdyMM34rzf/0eVDJ+EYZsk0gB1rGdAWy3h28PLomJlnxWVX+QnP0bBqa466HxTjljFyOC8MeNeFsJkasglLxvkUo1+soSxNLDSWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rgaw3S6r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rgaw3S6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746021073; x=1777557073;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=+ldYEvqb+hwZaur+5ZU3Vf/BQL2XMqQNtO4hKxG/Pr4=;
  b=Rgaw3S6ruQ6YXXhgYCye3qq+w2+4LYd4c1nF3ZRRRBesQkTM1/n2oU3S
   arZKSi7shHLJJiLVzlkFsxe6ADMQyk3GITU+STqjmgmPz9weUeabbEKPB
   kI8V7pMPkailpJHphFZpDYJKFYvkO/THPhz62qKCxFMUBjYT2kj6iwDlM
   oqFeUknB/Rl7ZysAyeObiQAjmMIpunK6ssbhM+VQjMNmLAuxZEmkspVKf
   trOdkefZpja9VstvJg8iPzUlRoIW0hSS9anUtJGIS8VFjcDWHXsayiE0h
   4hokNPqzLDuzGJGWD7pEbrPlZnWqd2QBGGuv4e3fGU1IeojxH9CdmFQns
   w==;
X-CSE-ConnectionGUID: 4C9e7p2STIuZhSG8Q5d0Vg==
X-CSE-MsgGUID: WizxTMA2QRCA3L//ShMK+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="35297142"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="35297142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 06:51:12 -0700
X-CSE-ConnectionGUID: CjlYMQdcRBuDr657SkmKVA==
X-CSE-MsgGUID: abKzfZaSRlqglQ9CjqbPUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133844232"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 06:51:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Harry Austen <hpausten@protonmail.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Allow building as kernel built-in
In-Reply-To: <47kdwkkmejb7ot6qbfvto6heunnosggyn5o76gaaqcjdiviqt7@4h6u3hdxy3jb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250425115148.12815-1-hpausten@protonmail.com>
 <874iy7w58c.fsf@intel.com>
 <47kdwkkmejb7ot6qbfvto6heunnosggyn5o76gaaqcjdiviqt7@4h6u3hdxy3jb>
Date: Wed, 30 Apr 2025 16:51:06 +0300
Message-ID: <87ecx9vjud.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 30 Apr 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> I think we really need to start spliting the module and move the
> conflicting symbols.

Start? I've been working on it for more than a year now.

BR,
Jani.

-- 
Jani Nikula, Intel
