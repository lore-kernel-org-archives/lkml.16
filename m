Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6E1201004
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009963; cv=none; b=mqMQAEyfSuht7RQXieRYaaw5x4NiOmh62c8YP96t0BF6HVoXtvKVDvAw9eyEtmgsXMvVkIXCfLUaMHKtbtX7THHKnf7tCjmBXLzQ8oPgXKgt+5K6mLOOkHt0BQyFYyEvLrY0Gl+uc4NcoMq3BER22TePiQCza4zypI67dY9Ib5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009963; c=relaxed/simple;
	bh=k4pTxXHu/ym53e4/UX+/s4XEjOgvp6rm21tatX7THV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=to3IfJunyl8To7wjMD4fDLp/dphbbv2E1O1oqSuXwWbhcnc29qAWHPBuDbxe0r8P3UUyFDMC6UiEAFZItzyIW9EHHIY1qsx3+gMpACtfIhcE0TISmls1ZMGlhh/bGDyoJydL4Sjbth3ek3jcO+xC4kr0phFMflr7QbLlP5EaCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-fd-685e4a9b53bd
From: Rakie Kim <rakie.kim@sk.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	Gregory Price <gourry@gourry.net>,
	kernel_team@skhynix.com
Subject: Re: [PATCH 1/2] mm/mempolicy: Simplify weighted interleave bulk alloc calculations
Date: Fri, 27 Jun 2025 16:38:45 +0900
Message-ID: <20250627073902.1963-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250626200936.3974420-2-joshua.hahnjy@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsXC9ZZnke5sr7gMg8XH5C3mrF/DZrHrRojF
	1/W/mC1+3j3ObnF86zx2i30XgeKXd81hs7i35j+rxbc+aYvVazIsZh+9x+7A7bFz1l12j+62
	y+wei/e8ZPLY9GkSu8eJGb9ZPHY+tPQ4d7HCo7f5HZvH+31X2Tw+b5IL4IrisklJzcksSy3S
	t0vgyngzpZOpYB9vxbpVJxgbGDdzdTFycEgImEj0b+WHMac9dgIx2QSUJI7tjeli5OQQEdCU
	ONE6ibmLkYuDWeAws8SL+Z/YQBLCAtES+47OYgaxWQRUJTbt6wGL8wKNmf+/lRHElgBqbrh0
	jwnE5hSwlzh8YgMLiC0kwCPxasN+Roh6QYmTM5+AxZkF5CWat84GWyYh8JpNomvVfXaIQZIS
	B1fcYJnAyD8LSc8sJD0LGJlWMQpl5pXlJmbmmOhlVOZlVugl5+duYgSG/rLaP9E7GD9dCD7E
	KMDBqMTDa6EfmyHEmlhWXJl7iFGCg1lJhJf3GlCINyWxsiq1KD++qDQntfgQozQHi5I4r9G3
	8hQhgfTEktTs1NSC1CKYLBMHp1QDY+bltRXLA1N2FQWfmtnlGuqfESBQrzvjpkyj+w+963Zt
	viX2ewUvPbQLfN0jJaibJHBhRsbFD7wl+S01p09drd9zUNavR8fRTvrDqb9x1bI6ugzz5y1V
	9rwZ+Ens/z+p9H3aAbNtZpvPrArn4v8xcdoivqyX8Qor5AwUudz4r8zZO9P1naiNEktxRqKh
	FnNRcSIA41uoNXkCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsXCNUNNS3e2V1yGwc0bYhZz1q9hs9h1I8Ti
	3JTZbBZf1/9itvh59zi7xfGt89gt9l0ESh6ee5LV4vKuOWwW99b8Z7X41idtcejac1aL1Wsy
	LGYfvcfuwOexc9Zddo/utsvsHov3vGTy2PRpErvHiRm/WTx2PrT0OHexwqO3+R2bx/t9V9k8
	vt328Fj84gOTx+dNcgE8UVw2Kak5mWWpRfp2CVwZb6Z0MhXs461Yt+oEYwPjZq4uRg4OCQET
	iWmPnUBMNgEliWN7Y7oYOTlEBDQlTrROYu5i5OJgFjjMLPFi/ic2kISwQLTEvqOzmEFsFgFV
	iU37esDivEBj5v9vZQSxJYCaGy7dYwKxOQXsJQ6f2MACYgsJ8Ei82rCfEaJeUOLkzCdgcWYB
	eYnmrbOZJzDyzEKSmoUktYCRaRWjSGZeWW5iZo6pXnF2RmVeZoVecn7uJkZgmC+r/TNxB+OX
	y+6HGAU4GJV4eC30YzOEWBPLiitzDzFKcDArifDyXgMK8aYkVlalFuXHF5XmpBYfYpTmYFES
	5/UKT00QEkhPLEnNTk0tSC2CyTJxcEo1MBrtO+jEsaPY6wzf5Nlsr8TPz050DUo6b3RzLXNJ
	yuqcL0kzwrqfuCfam9x8NO8hu+WUjOUBTF4WZrt0V+wW95wo8lE1qZ/Ny3P+zRyb8/NN3ikV
	Vl3b2fL+qeKVGa3bpBYnZiSfnPB+ZtTXGZee/fUVDeB4sq/vYbHsqa5Ym7kp1Ys6VrBs+qTE
	UpyRaKjFXFScCAB3kTAubwIAAA==
X-CFilter-Loop: Reflected

On Thu, 26 Jun 2025 13:09:33 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> Simplify the math used to figure out how many pages should be allocated
> per node. Instead of making conditional additions and deletions, we can just
> make them unconditional by using min(). No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> 
> ---
>  mm/mempolicy.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 3b1dfd08338b..78ad74a0e249 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2645,18 +2645,15 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	for (i = 0; i < nnodes; i++) {
>  		node = next_node_in(prev_node, nodes);
>  		weight = weights[node];
> -		node_pages = weight * rounds;
> -		/* If a delta exists, add this node's portion of the delta */
> -		if (delta > weight) {
> -			node_pages += weight;
> -			delta -= weight;
> -		} else if (delta) {
> -			/* when delta is depleted, resume from that node */
> -			node_pages += delta;
> +		/* when delta is depleted, resume from that node */
> +		if (delta && delta < weight) {
>  			resume_node = node;
>  			resume_weight = weight - delta;
> -			delta = 0;
>  		}
> +		/* Add the node's portion of the delta, if there is one */
> +		node_pages = weight * rounds + min(delta, weight);
> +		delta -= min(delta, weight);
> +
>  		/* node_pages can be 0 if an allocation fails and rounds == 0 */
>  		if (!node_pages)
>  			break;
> -- 
> 2.47.1
> 

The updated logic improves clarity and readability. Well structured change.

Reviewed-by: Rakie Kim <rakie.kim@sk.com>

