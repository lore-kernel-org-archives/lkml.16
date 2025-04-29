Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3065A15F330
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889139; cv=none; b=ikp2BjneyHJNRfn9/DVSi/rLGIY5Tci8T/CuLsssk/XEhMmQYu3MDpD9csXN7OHXfC6tYwYtbpSTXJFtBN61wXJlz/JxmiIIqAb911g9Vmvay/7A53hUNuA6VlwsllVvFAl094oQSEBJWTfDX1wZl3oDvD+uU09awmoM59p9fzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889139; c=relaxed/simple;
	bh=8HujOxCwXXWmCeDmCYyTBIChPGHELa36gU+OXosXg9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fezq+I7nGPg8pzeBlpVr9ULFNWiaikUe7RCUvl0WSdkp06wRUKxcWp4lBv6LEEc7EnpZl3r5jV5SswA7dG/V2kCy26YItXdYA/kDCPhqwYcbApUrGRS5DDbQMqjs+/C/INrqVFOkKGZu1LGXeHYk7cgc/4jlo6ovmO4ELQGhAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MhM9KXiI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MhM9KXiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745889137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tqSy+oRPCXjazV/uUo1lx7P018yh47TJz3P0mjl0sag=;
	b=MhM9KXiIOs0E6Y/DF7vMQ60yPtNqFhkooxGxev+BfryFDYPYUQLCBfeZbhBel7NAtOf1xS
	cLJe3ep4incn5JooXeFqLh5WBS/8ME8mRKMo6bB/X+/z8WFNHpRaxT8HRVSimo5PA0ISHp
	y1+tQGYZj31gQonLcOTDxSz8soXphwY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-ilqj4ZvCOS2j7x1IPN3d3A-1; Mon,
 28 Apr 2025 21:12:12 -0400
X-MC-Unique: ilqj4ZvCOS2j7x1IPN3d3A-1
X-Mimecast-MFC-AGG-ID: ilqj4ZvCOS2j7x1IPN3d3A_1745889131
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7E4F1800368;
	Tue, 29 Apr 2025 01:12:10 +0000 (UTC)
Received: from fedora (unknown [10.72.116.57])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2B0E180045C;
	Tue, 29 Apr 2025 01:12:07 +0000 (UTC)
Date: Tue, 29 Apr 2025 09:12:03 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] selftests: ublk: make test_generic_06 silent on
 success
Message-ID: <aBAnY0RhnkFXBJdK@fedora>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
 <20250428-ublk_selftests-v1-2-5795f7b00cda@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-ublk_selftests-v1-2-5795f7b00cda@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Mon, Apr 28, 2025 at 05:10:21PM -0600, Uday Shankar wrote:
> Convention dictates that tests should not log anything on success. Make
> test_generic_06 follow this convention.
> 
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

